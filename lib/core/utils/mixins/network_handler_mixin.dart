// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:starskop/core/error/failure.dart';

// /// Network handler mixin to handle network exceptions
// mixin NetworkHandlerMixin {
//   Future<Either<Failure?, R>> networkHandler<R extends Object?>(
//     Future<R> Function() f,
//   ) async {
//     try {
//       return Right(await f());
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } on DioException catch (e) {
//       return Left(
//         switch (e.type) {
//           DioExceptionType.connectionTimeout ||
//           DioExceptionType.sendTimeout ||
//           DioExceptionType.receiveTimeout =>
//             const TimeoutFailure('Timeout failure'),
//           DioExceptionType.badCertificate ||
//           DioExceptionType.badResponse ||
//           DioExceptionType.connectionError =>
//             const ConnectionFailure('Connection failure'),
//           DioExceptionType.cancel => null,
//           DioExceptionType.unknown => const UnknownFailure('Unknown failure'),
//         },
//       );
//     } catch (s) {
//       return const Left(UnknownFailure('Unknown failure'));
//     }
//   }

//   Future<Either<Failure?, R>> firebaseRequestHandler<R extends Object?>(
//     Future<R> Function() f,
//   ) async {
//     try {
//       return Right(await f());
//     } on FirebaseException catch (e) {
//       return Left(
//         switch (e.code) {
//           'permission-denied' =>
//             const AuthorizationFailure('Permission denied'),
//           'not-found' => const NotFoundFailure('Resource not found'),
//           'already-exists' => const ConflictFailure('Resource already exists'),
//           'unavailable' =>
//             const ServiceUnavailableFailure('Service unavailable'),
//           'unauthenticated' =>
//             const AuthenticationFailure('User not authenticated'),
//           _ => FirebaseFailure(e.message ?? 'Unknown Firebase error'),
//         },
//       );
//     } catch (s) {
//       return const Left(UnknownFailure('Unknown failure'));
//     }
//   }
// }
