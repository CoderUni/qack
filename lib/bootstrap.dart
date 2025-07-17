import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http_client/http_client.dart';
import 'package:qack/constants/key_name.dart';
import 'package:qack/presentation/history/bloc/history_bloc.dart';
import 'package:qack/presentation/history/repositories/repositories.dart';
import 'package:qack/presentation/home/cubit/word_of_the_day_cubit.dart';
import 'package:qack/presentation/home/repositories/repositories.dart';
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
    HistoryBloc historyBloc,
    WordOfTheDayCubit wordOfTheDayCubit,
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

  // Initialize HTTP repository
  GetIt.instance.registerLazySingleton<Http>(Http.new);

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

  final translatorSettings = await settingsRepository.getAPIKey();

  final settingsBloc = SettingsBloc(
    settingsRepository: settingsRepository,
  )..add(
      SettingsFetch(translatorSettings),
    );

  // Initialize history bloc
  final historyBloc = HistoryBloc(
    HistoryRepository(appDatabase: appDatabase),
  )..add(const HistoryFetched());

  // Initialize word of the day cubit
  final wordOfTheDayCubit = WordOfTheDayCubit(
    const WordOfTheDayRepository(),
    // ignore: unawaited_futures
  );

  // Fetch the word of the day if DeepSeek API key is available
  final deepSeekApiKey = translatorSettings.apiKeys[KeyNameConstants.deepSeek];
  if (deepSeekApiKey != null && deepSeekApiKey.isNotEmpty) {
    unawaited(wordOfTheDayCubit.fetch(deepSeekApiKey));
  }

  Bloc.observer = const AppBlocObserver();

  runApp(
    await builder(
      secureStorage,
      settingsBloc,
      historyBloc,
      wordOfTheDayCubit,
      appDatabase,
    ),
  );
}
