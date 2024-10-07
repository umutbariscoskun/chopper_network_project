import 'package:chopper_network/core/error/failure.dart';
import 'package:dartz/dartz.dart';

typedef BaseResponse<T extends Object?> = Future<Either<Failure?, T>>;
