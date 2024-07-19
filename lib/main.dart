import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:poke_app/core/shared/config/environment_config.dart';
import 'package:poke_app/main_intermediary.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: '.env.dev');

    final environmentConfig = EnvironmentConfig(
        environment: EnvironmentType.development.env,
        apiBase: dotenv.env['API_BASE']!);

    mainIntermediary(environmentConfig);
  }, (error, stack) {
    throw 'Error main.dev $error, stack $stack';
  });
}