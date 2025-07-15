import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qack/gen/fonts.gen.dart';
import 'package:qack/l10n/arb/app_localizations.dart';
import 'package:qack/layout/device_info_setter.dart';
import 'package:qack/presentation/history/bloc/history_bloc.dart';
import 'package:qack/presentation/history/repositories/repositories.dart';
import 'package:qack/presentation/home/bloc/home_bloc.dart';
import 'package:qack/presentation/home/repositories/repositories.dart';
import 'package:qack/presentation/landing/components/cubit/bottom_navigation_bar_cubit.dart';
import 'package:qack/presentation/landing/view/landing_page.dart';
import 'package:qack/presentation/settings/bloc/settings_bloc.dart';
import 'package:qack/presentation/settings/respository/settings_repository.dart';
import 'package:qack/theme/colors.dart';
import 'package:qack/theme/themes/light_theme.dart';
import 'package:qack/utils/database/database.dart';

class App extends StatelessWidget {
  const App({
    required this.secureStorage,
    required this.settingsBloc,
    required this.historyBloc,
    required this.appDatabase,
    super.key,
  });

  final FlutterSecureStorage secureStorage;
  final SettingsBloc settingsBloc;
  final HistoryBloc historyBloc;
  final AppDatabase appDatabase;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => appDatabase),
        RepositoryProvider(
          create: (context) => SettingsRepository(
            storage: secureStorage,
          ),
        ),
        RepositoryProvider(
          create: (context) => HomeRepository(storage: secureStorage),
        ),
      ],
      child: _App(
        settingsBloc: settingsBloc,
        historyBloc: historyBloc,
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App({required this.settingsBloc, required this.historyBloc});
  final SettingsBloc settingsBloc;
  final HistoryBloc historyBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => settingsBloc),
        BlocProvider(
          create: (context) => HomeBloc(
            homeRepository: context.read<HomeRepository>(),
            settingsBloc: settingsBloc,
            appDatabase: context.read<AppDatabase>(),
          ),
        ),
        BlocProvider(
          create: (context) => historyBloc,
        ),
        BlocProvider(create: (context) => BottomNavigationBarCubit()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({
    super.key,
  });

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return Listener(
      onPointerDown: (_) => FocusManager().primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
          fontFamily: FontFamily.nunito,
          cardTheme: CardThemeData(
            color: theme.cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          scaffoldBackgroundColor: theme.scaffoldColor,
          cardColor: theme.cardColor,
          primaryColor: AppColors.primary500,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LandingPage(),
        builder: (context, Widget? child) => DeviceInfoSetter(child: child!),
      ),
    );
  }
}
