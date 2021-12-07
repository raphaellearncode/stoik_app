import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/main.dart';
import 'package:stoik_app/providers/onboarding_provider/onboarding_provider.dart';
import 'package:stoik_app/screens/onboarding_screens/welcome_page.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:after_layout/after_layout.dart';
import 'package:stoik_app/widgets/cards/logo_card.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with AfterLayoutMixin<LaunchScreen>, SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  OnBoardingProvider _onBoardingProvider = OnBoardingProvider();

  Future checkFirstSeen() async {
    if (_onBoardingProvider.isIntro == true) {
      Navigator.of(context).pushReplacement(CustomPageRoute(
          child: const HomePage(
            title: 'STOLIK',
          ),
          direction: AxisDirection.left));
    } else {
      Navigator.of(context).pushReplacement(CustomPageRoute(
          child: const IntroScreen(), direction: AxisDirection.left));
      print('onboarding screen is loaded');
    }
  }

  @override
  void afterFirstLayout(BuildContext context) =>
      Future.delayed(const Duration(seconds: 2))
          .then((value) => checkFirstSeen());

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutBack));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ChangeNotifierProvider.value(
          value: _onBoardingProvider,
          child: Container(
              key: widget.key,
              child: Center(
                child: ScaleTransition(
                    scale: _scaleAnimation, child: const Logo()),
              )),
        ));
  }
}
