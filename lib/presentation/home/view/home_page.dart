import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qack/utils/extensions/date_time.dart';
import 'package:qack/widgets/input/input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final TimeOfTheDay timeOfTheDay;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    timeOfTheDay = DateTime.now().toTimeOfTheDay;

    // Set it to forward to start the animation
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: DecoratedBox(
              decoration: BoxDecoration(
                gradient: timeOfTheDay.gradient,
              ),
              child: SizedBox.expand(
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RotationTransition(
                            turns: Tween<double>(begin: 0, end: 2)
                                .animate(animationController),
                            child: timeOfTheDay.getIcon(32),
                          ),
                          const Gap(8),
                          AnimatedBuilder(
                            animation: animationController,
                            builder: (context, child) {
                              // TODO: Change this to positioned transition
                              return AutoSizeText(
                                timeOfTheDay.getGreeting('Hans'),
                                minFontSize: 18,
                                maxFontSize: 28,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2,
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Text('Word of the day: Hello'),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: AppSearchBar(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              InputText(
                maxLength: 400,
                labelText: '',
                onChanged: (text) {
                  // TODO: Handle text change using bloc
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
