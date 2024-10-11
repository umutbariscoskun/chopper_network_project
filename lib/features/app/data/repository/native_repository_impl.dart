import 'dart:async';
import 'dart:developer';

import 'package:chopper_network/core/error/failure.dart';

import 'package:chopper_network/features/app/domain/repository/native_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NativeRepository)
@lazySingleton
class NativeRepositoryImpl implements NativeRepository {
  NativeRepositoryImpl();

  static const platform = MethodChannel('com.example.app/anime');

  @override
  Future<Either<Failure, bool>> getNetworkStatus() async {
    try {
      // Invoke the native method and wait for the result
      final result = await platform.invokeMethod('checkDeviceInfos')
          as Map<Object?, Object?>;

      if (result['networkStatus'] == null) {
        return const Left(ServerFailure('Error when getting network status'));
      }
      // Check network status
      final networkStatus = result['networkStatus']! as bool;

      return Right(networkStatus);
    } on PlatformException catch (e) {
      log('PlatformException: ${e.message}');
      return Left(
        ServerFailure('Failed to invoke native method: ${e.message}'),
      );
    } catch (e, st) {
      log('Error: $e');
      log('Stack trace: $st');
      return Left(ServerFailure(e.toString()));
    }
  }
}
