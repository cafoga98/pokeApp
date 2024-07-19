import 'dart:convert';

import 'package:http/http.dart';

import '/generated/l10n.dart';
import '/core/shared/error_handle/exceptions.dart';
import '/core/shared/config/connectivity_checker.dart';

/// ApiConfig Class
///
/// Manages the configuration and handling of API requests. It includes methods
/// for making GET and POST requests, handling network connectivity, and managing
/// response data.
///
/// Example usage:
///
/// ```dart
/// final apiConfig = ApiConfig(
///   connectivityChecker: ConnectivityChecker(),
///   client: Client(),
/// );
///
/// final data = await apiConfig.apiGet('https://api.example.com/data');
/// ```
class ApiConfig {
  final ConnectivityChecker connectivityChecker;
  final Client client;

  /// Creates an [ApiConfig] with the provided [connectivityChecker] and [client].
  ApiConfig({
    required this.connectivityChecker,
    required this.client,
  });

  /// Makes a GET request to the specified [uri] with optional [headers].
  ///
  /// Throws exceptions for various scenarios, such as no internet connection,
  /// timeout, and different response status codes.
  Future<dynamic> apiGet(
      String uri, {
        Map<String, String>? headers,
      }) async {
    try {
      ///Valid internet connection
      if (await connectivityChecker.checkingConnection() == false) {
        throw NoConnectionException(S.current.noConnection);
      }

      final response =
      await client.get(Uri.parse(uri), headers: headers).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          throw TimeOutException(S.current.timeOut);
        },
      );
      return _responseManager(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Makes a POST request to the specified [uri] with optional [body] and [headers].
  ///
  /// Throws exceptions for various scenarios, such as no internet connection,
  /// timeout, and different response status codes.
  Future<dynamic> apiPost(
    String uri, {
    Object? body,
    Map<String, String>? headers,
  }) async {
    try {
      ///Valid internet connection
      if (await connectivityChecker.checkingConnection() == false) {
        throw NoConnectionException(S.current.noConnection);
      }

      final response = await client
          .post(
        Uri.parse(uri),
        body: body,
        headers: headers,
      )
          .timeout(
        const Duration(seconds: 60),
        onTimeout: () {
          throw TimeOutException(S.current.timeOut);
        },
      );
      return _responseManager(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Handles the response from the API by checking the status code.
  ///
  /// Throws specific exceptions based on the response status code.
  _responseManager(Response response) {
    switch (response.statusCode) {
      case 200:
        if (response.body.toString().isNotEmpty) {
          return json.decode(response.body);
        } else {
          throw NoDataException(S.current.noData);
        }
      case 201:
        throw UnauthorisedException(S.current.unauthorised);
      case 400:
        throw BadRequestException(S.current.noData);
      case 500:
        throw ServerException(S.current.noData);
      default:
        throw NoDataException(S.current.noData);
    }
  }
}
