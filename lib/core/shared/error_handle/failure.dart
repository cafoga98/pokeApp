import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Failure Class
///
/// Represents various types of failures that can occur in the application. It is
/// implemented using the `freezed` package.
///
/// Example usage:
///
/// ```dart
/// final failure = Failure.serverFailure(message: 'Server error');
/// ```
@freezed
class Failure with _$Failure {
  const Failure._();

  /// Represents a failure related to a server error with an optional error [message].
  const factory Failure.serverFailure({@Default(null) final String? message}) = ServerFailure;

  /// Represents a failure related to a lack of data with an optional error [message].
  const factory Failure.noData({@Default(null) final String? message}) = NoData;

  /// Represents a failure related to no internet connection with an optional error [message].
  const factory Failure.noConnection({@Default(null) final String? message}) = NoConnection;

  /// Represents a failure indicating that an action could not be completed with an optional error [message].
  const factory Failure.noActionComplete({@Default(null) final String? message}) = NoActionComplete;
}
