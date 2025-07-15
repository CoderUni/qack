import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qack/app/view/app.dart';
import 'package:qack/bootstrap.dart';
import 'package:qack/constants/constants.dart';
import 'package:qack/presentation/history/bloc/history_bloc.dart';
import 'package:qack/presentation/settings/bloc/settings_bloc.dart';
import 'package:qack/utils/database/database.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  // Read .env file
  await dotenv.load(fileName: 'assets/.env');

  SentryWidgetsFlutterBinding.ensureInitialized();

  await SentryFlutter.init(
    (options) {
      options
        ..environment = 'staging'
        ..tracesSampleRate = 1.0
        ..sendDefaultPii = true
        ..dsn = dotenv.env[KeyNameConstants.sentryEnv];
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
          HistoryBloc historyBloc,
          AppDatabase appDatabase,
        ) async {
          return App(
            secureStorage: secureStorage,
            settingsBloc: settingsBloc,
            historyBloc: historyBloc,
            appDatabase: appDatabase,
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
