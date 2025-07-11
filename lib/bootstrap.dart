import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http_client/http_client.dart';
import 'package:qack/constants/key_name.dart';
import 'package:qack/presentation/settings/bloc/settings_bloc.dart';
import 'package:qack/presentation/settings/respository/settings_repository.dart';
import 'package:qack/utils/database/database.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    Sentry.captureException(
      error,
      stackTrace: stackTrace,
    );

    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  ISentrySpan span,
  FutureOr<Widget> Function(
    FlutterSecureStorage secureStorage,
    SettingsBloc settingsBloc,
    AppDatabase appDatabase,
  ) builder,
) async {
  FlutterError.onError = (details) {
    Sentry.captureException(
      details,
      stackTrace: details.stack,
    );

    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Initialize local storage repository
  final appDatabase = AppDatabase();

  final secureStorageBinding = span.startChild(
    'retrieve secure storage values',
    description: 'retrieve required startup values from secure storage',
  );
  // Initialize secure storage
  const secureStorage = FlutterSecureStorage();
  try {
    // Create a random salt if it doesn't exist.
    final salt = await secureStorage.read(key: KeyNameConstants.md5Salt);
    if (salt == null || salt.isEmpty) {
      // Create a random salt and store it in secure storage
      await secureStorage.write(
        key: KeyNameConstants.md5Salt,
        value: DateTime.now().millisecondsSinceEpoch.toString(),
      );
    }
  } catch (e) {
    secureStorageBinding
      ..throwable = e
      ..status = const SpanStatus.internalError();
  } finally {
    await secureStorageBinding.finish();
  }

  // Initialize settings bloc
  final settingsRepository = SettingsRepository(storage: secureStorage);
  final settingsBloc = SettingsBloc(
    settingsRepository: settingsRepository,
  )..add(
      SettingsFetch(await settingsRepository.getAPIKey()),
    );

  // Initialize HTTP repository
  GetIt.instance.registerLazySingleton<Http>(Http.new);

  Bloc.observer = const AppBlocObserver();

  runApp(await builder(secureStorage, settingsBloc, appDatabase));
}
