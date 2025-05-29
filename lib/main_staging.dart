import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qack/app/view/app.dart';
import 'package:qack/bootstrap.dart';
import 'package:qack/presentation/settings/bloc/settings_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  // Read .env file
  await dotenv.load(fileName: 'assets/.env');

  await SentryFlutter.init(
    (options) {
      options
        ..environment = 'staging'
        ..tracesSampleRate = 1.0
        ..sendDefaultPii = true
        ..dsn = dotenv.env['sentryLink'];
    },
    appRunner: () async {
      final transaction = Sentry.startTransaction(
        'bootstrap()',
        'initialization',
        bindToScope: true,
      );

      try {
        await bootstrap(transaction, (
          FlutterSecureStorage secureStorage,
          SettingsBloc settingsBloc,
        ) async {
          return App(
            secureStorage: secureStorage,
            settingsBloc: settingsBloc,
          );
        });
      } catch (exception) {
        transaction
          ..throwable = exception
          ..status = const SpanStatus.internalError();
      } finally {
        await transaction.finish();
      }
    },
  );
}
