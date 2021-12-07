import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/model/learning_model.dart';
import 'package:stoik_app/providers/home_provider/home_provider.dart';

class SentenceCard extends StatefulWidget {
  const SentenceCard({
    Key? key,
    // required this.description,
    // required this.imgAssets,
    // required this.author
  }) : super(key: key);

  @override
  State<SentenceCard> createState() => _SentenceCardState();
}

class _SentenceCardState extends State<SentenceCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationScaleController;
  late Animation<double> _fadeIn;
  late Animation<double> _scaleIn;

  late LearnModel sentence = sentenceList[0];

  final List<LearnModel> sentenceList = [
    LearnModel(
        'Marek Aurliusz',
        '''``Wypadki zewnetrzne duszy nie dotykają, lecz stoją spokojnie poza nią, a wszelki niepokój jest jedynie skutkiem wewnętrznego sądu.`` ''',
        'assets/images/meditation.png'),
    LearnModel(
        'Seneka',
        '''``Tylko w porównaniu z innymi jest się nieszczęśliwym``''',
        'assets/images/edu1.png'),
    LearnModel(
        'Epiktet',
        '''``Kiedy jesteś sam, powinieneś nazwać ten stan spokojem i wolnością i myśleć o sobie, jakbyś był bogiem, a gdy jesteś wśród wielu, nie powinieneś nazywać tego stanu tłumem, trudem, podrażnieniem, lecz festynem i zgromadzeniem, i przez to zaakceptować go całkowicie.`` ''',
        'assets/images/online_game.png'),
  ];

  int get sentenceListCounter {
    return sentenceList.length;
  }

  Future<LearnModel> randomSentence() async {
    setState(() {
      int randomSentenceIndex = 0;
      randomSentenceIndex = Random().nextInt(sentenceList.length);
      sentence = sentenceList[randomSentenceIndex];
    });

    // timer = Timer.periodic(Duration(seconds: sentenceDurations), (timer) {
    //   randomSentenceIndex = Random().nextInt(sentenceList.length);
    //   sentence = sentenceList[randomSentenceIndex];
    //   //todo remove prints
    //   // print('sntnc of a day is: ${sentence.description}');
    //   notifyListeners();
    // });
    return sentence;
  }

  void getSentence() async {
    sentence = await randomSentence();
  }

  @override
  void initState() {
    super.initState();

    _animationScaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _fadeIn = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    _scaleIn = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
        parent: _animationScaleController, curve: Curves.easeIn));

    _animationController.forward();
    _animationScaleController.forward();

    _animationController.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(seconds: 5), () {
            if (mounted) {
              _animationController.reverse().then((value) => getSentence());
            }
          });
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationScaleController.dispose();
    super.dispose();
  }

  // final String imgAssets;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        // final daySentence = homeProvider.sentence;
        return ScaleTransition(
          scale: _scaleIn,
          child: FadeTransition(
            opacity: _fadeIn,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0, left: 7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    sentence.assetPath,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  Text(sentence.description,
                      style: Theme.of(context).textTheme.bodyText1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(sentence.title,
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );

    // PlayAnimation<double>(
    //   tween: Tween<double>(begin: 0.7, end: 1.0),
    //   duration: const Duration(milliseconds: 300),
    //   delay: const Duration(milliseconds: 200),
    //   curve: Curves.easeIn,
    //   builder: (context, child, value) {
    //     return Transform.scale(
    //       scale: value,
    //       child: Padding(
    //         padding: const EdgeInsets.only(right: 12.0, left: 7.0),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Image.asset(
    //               imgAssets,
    //               width: MediaQuery.of(context).size.width * 0.5,
    //             ),
    //             Text(description,
    //                 style: Theme.of(context).textTheme.bodyText1),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Text(author,
    //                     style: Theme.of(context).textTheme.subtitle1),
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //     );
    //   });
  }
}
