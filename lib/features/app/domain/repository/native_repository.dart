import 'package:chopper_network/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NativeRepository {
  Future<Either<Failure, bool>> getNetworkStatus();
}
