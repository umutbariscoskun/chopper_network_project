import 'package:equatable/equatable.dart';

/// Base class for all failures in the app.
abstract class Failure extends Equatable {
  const Failure(this.message);

  /// The error message of the failure.
  final String message;

  @override
  List<Object?> get props => [message];
}

/// A failure that occurs when the server returns an error.
class ServerFailure extends Failure {
  /// Constructs a [ServerFailure] with the specified error [message].
  const ServerFailure(super.message);
}

/// A failure that occurs when the device has no internet.
class ConnectionFailure extends Failure {
  /// Constructs a [ConnectionFailure] with the specified error [message].
  const ConnectionFailure(super.message);
}

/// A failure that occurs when the database returns an error.
class DatabaseFailure extends Failure {
  /// Constructs a [DatabaseFailure] with the specified error [message].
  const DatabaseFailure(super.message);
}

/// A failure that occurs when the request times out.
class TimeoutFailure extends Failure {
  /// Constructs a [TimeoutFailure] with the specified error [message].
  const TimeoutFailure(super.message);
}

/// A failure that represents other unknown failures.
class UnknownFailure extends Failure {
  /// Constructs an [UnknownFailure] with the specified error [message].
  const UnknownFailure(super.message);
}
