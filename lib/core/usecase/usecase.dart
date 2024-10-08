import 'package:chopper_network/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<RT, T> {
  Future<Either<Failure, RT>> call(T param);
}

abstract class NoneFutureUseCase<RT, T> {
  Either<Failure, RT?> call(T params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class StreamUseCase<RT, T> {
  Stream<Either<Failure, RT>> call(T params);
}
