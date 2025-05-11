import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qack/gen/fonts.gen.dart';
import 'package:qack/l10n/l10n.dart';
import 'package:qack/layout/device_info_setter.dart';
import 'package:qack/presentation/landing/components/cubit/bottom_navigation_bar_cubit.dart';
import 'package:qack/presentation/landing/view/landing_page.dart';
import 'package:qack/presentation/settings/bloc/settings_bloc.dart';
import 'package:qack/presentation/settings/respository/settings_repository.dart';

class App extends StatelessWidget {
  const App({required this.secureStorage, super.key});
  final FlutterSecureStorage secureStorage;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: SettingsRepository(
            storage: secureStorage,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingsBloc(
              settingsRepository: context.read<SettingsRepository>(),
            ),
          ),
          BlocProvider(create: (context) => BottomNavigationBarCubit()),
        ],
        child: const AppView(),
      ),
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
  void initState() {
    context.read<SettingsBloc>().add(const SettingsFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) =>
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
          fontFamily: FontFamily.nunito,
          /*
          scaffoldBackgroundColor: state.theme.scaffoldColor,
          cardColor: state.theme.cardColor,
          primaryColor: AppColors.primary500,
          */
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LandingPage(),
        builder: (context, Widget? child) => DeviceInfoSetter(child: child!),
      ),
    );
  }
}
