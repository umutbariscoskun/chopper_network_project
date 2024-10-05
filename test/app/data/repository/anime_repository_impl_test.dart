import 'package:chopper/chopper.dart';
import 'package:chopper_network/core/error/failure.dart';
import 'package:chopper_network/features/app/data/repository/anime_repository_impl.dart';
import 'package:chopper_network/features/app/data/service/anime_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AnimeRepositoryImpl repository;
  late AnimeService animeService;
  late MockWebServer mockWebServer;

  setUpAll(() {});

  setUp(() async {
    mockWebServer = MockWebServer();
    await mockWebServer.start();

    final chopper = ChopperClient(
      baseUrl: Uri.parse(mockWebServer.url),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
    );

    animeService = AnimeService.create(chopper);
    repository = AnimeRepositoryImpl(animeService);
  });

  test('should return ServerFailure when there is no internet connection',
      () async {
    // Arrange
    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('com.example.app/anime'),
      (MethodCall methodCall) async {
        if (methodCall.method == 'checkDeviceInfos') {
          return {'networkStatus': false};
        }
        return null;
      },
    );

    final result = await repository.getTopAnime(page: 1);

    expect(result.isLeft(), true);
    result.fold(
      (failure) =>
          expect(failure, const ServerFailure('No internet connection')),
      (_) => fail('Test should return left with ServerFailure'),
    );
  });
}
