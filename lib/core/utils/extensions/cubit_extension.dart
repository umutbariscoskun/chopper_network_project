import 'package:chopper_network/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension FoldExtension on Cubit<dynamic> {
  Future<T?> foldAsync<T>(
    Future<Either<Failure, T>> Function() result,
  ) async {
    final response = await result();

    return response.fold(
      // ignore: only_throw_errors
      (l) => throw l,
      (r) => r,
    );
  }
}
