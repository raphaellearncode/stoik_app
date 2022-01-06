import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:stoik_app/main.dart';
import 'package:stoik_app/providers/onboarding_provider/onboarding_provider.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';
import 'package:stoik_app/widgets/buttons/indicators.dart';
import 'package:provider/provider.dart';
import 'onboarding_exports.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;

  var _currentPage = ValueNotifier<int>(0);

  final List<Widget> _onBoardingPages = const [
    IntroA(),
    IntroC(),
    IntroD(),
    IntroB(),
    IntroE(),
  ];

  UnmodifiableListView<Widget> get _onboardingPagesList {
    return UnmodifiableListView(_onBoardingPages);
  }

  int get _onBoardingListCounter {
    return _onBoardingPages.length;
  }

  _onPageChange(int page) {
    setState(() {
      _pageController.animateToPage(page,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);

      _currentPage.value = page;
    });
  }

  void nextPage() {
    setState(() {
      _pageController.animateToPage(_currentPage.value + 1,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  void prevPage() {
    setState(() {
      _pageController.animateToPage(_currentPage.value - 1,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage.value);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Consumer<OnBoardingProvider>(builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: _onBoardingListCounter,
                  controller: _pageController,
                  onPageChanged: _onPageChange,
                  itemBuilder: (context, index) {
                    return _onboardingPagesList
                        .map((e) => e)
                        .toList()
                        .elementAt(index);
                  }),
            ),
          ],
        );
      }),
      bottomNavigationBar: BottomAppBar(
        elevation: 3.0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child:
            Consumer<OnBoardingProvider>(builder: (context, provider, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: _currentPage.value <= 0 ? 0 : 1,
                child: FlatBtn(
                  title: '<',
                  color: Colors.transparent,
                  elevation: 0,
                  textColor: Colors.black,
                  onPress: () {
                    prevPage();
                  },
                ),
              ),
              Expanded(
                child: Indicators(
                  itemCount: _onBoardingListCounter,
                  currentPageNotifier: _currentPage,
                  dotSize: 10,
                ),
              ),
              FlatBtn(
                title: '>',
                color: Colors.transparent,
                elevation: 0,
                textColor: Colors.black,
                onPress: () async {
                  nextPage();
                  if (_currentPage.value == 4) {
                    provider.storeIntro(true);
                    await Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomePage(
                                  title: "Stolik",
                                )));
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
