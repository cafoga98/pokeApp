//import '../../mocks/mocks.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/core/shared/config/api_config.dart';
import 'package:poke_app/core/shared/error_handle/exceptions.dart';
import 'package:poke_app/generated/l10n.dart';

import '../../mocks/client/http/mock_http_client.mocks.dart';
import '../../mocks/connectivity_checker/mock_connectivity_checker.mocks.dart';

void main() {
  late MockClient mockClient;
  late MockConnectivityChecker mockConnectivityChecker;
  late ApiConfig apiConfig;
  const urlTest = 'https:/google.com';

  setUp(() {
    S.load(const Locale('en'));
    mockClient = MockClient();
    mockConnectivityChecker = MockConnectivityChecker();
    apiConfig = ApiConfig(
      connectivityChecker: mockConnectivityChecker,
      client: mockClient,
    );
  });

  group('ApiConfig', () {
    group('apiGet', () {
      test('return NoConnectionException', () async {
        when(mockConnectivityChecker.checkingConnection())
            .thenAnswer((_) async => false);
        final call = apiConfig.apiGet;

        expect(() => call(urlTest),
            throwsA(const TypeMatcher<NoConnectionException>()));

        verify(mockConnectivityChecker.checkingConnection()).called(1);
      });

      test('return BadRequestException', () async {
        when(mockConnectivityChecker.checkingConnection())
            .thenAnswer((_) async => true);

        when(mockClient.get(any))
            .thenAnswer((_) async => Response('Bad Request', 400));

        final call = apiConfig.apiGet;

        expect(() => call(urlTest),
            throwsA(const TypeMatcher<BadRequestException>()));

        verify(mockConnectivityChecker.checkingConnection()).called(1);
      });

      test('return ServerException', () async {
        when(mockConnectivityChecker.checkingConnection())
            .thenAnswer((_) async => true);

        when(mockClient.get(any))
            .thenAnswer((_) async => Response('Server Error', 500));

        final call = apiConfig.apiGet;

        expect(() => call(urlTest),
            throwsA(const TypeMatcher<ServerException>()));

        verify(mockConnectivityChecker.checkingConnection()).called(1);
      });
    });
  });
}
