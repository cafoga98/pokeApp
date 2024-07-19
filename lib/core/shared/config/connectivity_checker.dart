import 'package:connectivity_checker/connectivity_checker.dart';

/// ConnectivityChecker Class
///
/// Manages the checking of network connectivity using the provided [connectivity].
///
/// Example usage:
///
/// ```dart
/// final checker = ConnectivityChecker(connectivity: ConnectivityWrapper());
///
/// final isConnected = await checker.checkingConnection();
/// ```
class ConnectivityChecker {
  final ConnectivityWrapper connectivity;

  /// Creates a [ConnectivityChecker] with the provided [connectivity].
  ConnectivityChecker({required this.connectivity});

  /// Checks the network connectivity and returns a boolean indicating whether
  /// the device is currently connected to the internet.
  Future<bool> checkingConnection() async => await connectivity.isConnected;
}