import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qack/app/view/app.dart';
import 'package:qack/bootstrap.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  // Read .env file
  await dotenv.load(fileName: 'assets/.env');

  await SentryFlutter.init(
    (options) {
      options
        ..environment = 'development'
        ..tracesSampleRate = 1.0
        ..dsn = dotenv.env['sentryLink'];
    },
    appRunner: () async {
      await bootstrap((FlutterSecureStorage secureStorage) async {
        return App(secureStorage: secureStorage);
      });
    },
  );
}
