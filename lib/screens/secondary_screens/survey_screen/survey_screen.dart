import 'package:flutter/material.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';

import 'survey_page1.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  late PageController _pageController;

  int _currentPage = 0;

  _onPageChange() {
    setState(() {
      _pageController.nextPage(
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);
    });
  }

  final List<Widget> _surveyPages = [
    Page1(),
    Page1(),
    Page1(),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                physics: const BouncingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                itemCount: _surveyPages.length,
                itemBuilder: (context, index) {
                  return _surveyPages.map((e) => e).toList().elementAt(index);
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatBtn(
                  title: 'Następna',
                  onPress: () {
                    _onPageChange();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
