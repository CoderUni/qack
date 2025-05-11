import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/home/view/home_page.dart';
import 'package:qack/presentation/landing/components/components.dart';
import 'package:qack/presentation/settings/view/settings_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutHandler(
      mobile: MobileLandingPage(),
      tablet: TabletLandingPage(),
    );
  }
}

class MobileLandingPage extends StatefulWidget {
  const MobileLandingPage({super.key});

  @override
  State<MobileLandingPage> createState() => _MobileLandingPageState();
}

class _MobileLandingPageState extends State<MobileLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          switch (state.selectedPage) {
            case SelectedPage.home:
              return const HomePage();
            case SelectedPage.settings:
              return const SettingsPage();
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(key: UniqueKey()),
    );
  }
}

class TabletLandingPage extends StatefulWidget {
  const TabletLandingPage({super.key});

  @override
  State<TabletLandingPage> createState() => _TabletLandingPageState();
}

class _TabletLandingPageState extends State<TabletLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          switch (state.selectedPage) {
            case SelectedPage.home:
              return const HomePage();
            case SelectedPage.settings:
              return const SettingsPage();
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(key: UniqueKey()),
    );
  }
}
