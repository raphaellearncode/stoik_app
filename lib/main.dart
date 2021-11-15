import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stoik_app/screens/main_screens/screens_exports.dart';

import 'model/nav_model.dart';
import 'model/screen_model.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;
  bool isRailExtended = false;

  late AnimationController _animationController;

  late Animation<Offset> _menuAnimation;

  void openMenu() {
    setState(() {
      //isRailExtended = !isRailExtended;
      // if (_animationController.isCompleted) {
      //   _animationController.reverse();
      // } else {
      //   _animationController.forward();
      // }
    });
  }

  final List<ScreenModel> _pages = [
    ScreenModel(
        NavModel(title: "Start", icon: Icons.dashboard), const HomeScreen()),
    ScreenModel(
        NavModel(title: "Nauka", icon: Icons.school), const EducationScreen()),
    ScreenModel(
        NavModel(title: "Statystyki", icon: Icons.bar_chart), const ScreenD()),
    ScreenModel(
        NavModel(title: "O aplikacji", icon: Icons.info), const AboutScreen()),
    ScreenModel(NavModel(title: "Ustawienia", icon: Icons.settings),
        const SettingsScreen()),
  ];

  _onPageChange(int page) {
    setState(() {
      _pageController.animateToPage(page,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);

      _currentPage = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _menuAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.6, 0.1))
            .animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: widget.key,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(-0.5, 0),
                        blurRadius: 0.5)
                  ]),
              child: NavigationRail(
                // minWidth: 35,
                groupAlignment: -0.3,
                leading: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.amber.shade400,
                      child: const Icon(
                        Icons.person,
                        size: 23,
                        color: Colors.white,
                      ),
                    )),
                backgroundColor: Colors.transparent,
                extended: isRailExtended,
                labelType: NavigationRailLabelType.none,
                selectedIconTheme: const IconThemeData(color: Colors.amber),
                selectedLabelTextStyle: const TextStyle(color: Colors.amber),
                destinations: List.generate(
                    _pages.length,
                    (index) => NavigationRailDestination(
                          icon: Icon(
                            _pages[index].pageTitle.icon,
                            size: 18,
                          ),
                          label: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              '${_pages[index].pageTitle.title}  ',
                            ),
                          ),
                        )).toList(),
                selectedIndex: _currentPage,
                onDestinationSelected: (int sel) {
                  _onPageChange(sel);
                },
              ),
            ),
            Expanded(
              child: SlideTransition(
                position: _menuAnimation,
                child: Container(
                  key: widget.key,
                  child: Center(
                      key: widget.key,
                      child: PageView.builder(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: _pages.length,
                          controller: _pageController,
                          onPageChanged: _onPageChange,
                          itemBuilder: (context, index) {
                            return _pages
                                .map((e) => e.item)
                                .toList()
                                .elementAt(index);
                          })),
                ),
              ),
            )
          ],
        ),
      ),
      // Stack(children: [
      //
      // ]),
    );
  }
}
