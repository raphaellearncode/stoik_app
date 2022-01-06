import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/model/learning_model.dart';
import 'package:stoik_app/providers/home_provider/home_provider.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';

class SentenceCard extends StatefulWidget {
  const SentenceCard({
    Key? key,
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
        'Marek Aureliusz',
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
    LearnModel(
        'Jan Kochanowski',
        '''``Nie porzucaj nadzieje, Jakoć się kolwiek dzieje`` ''',
        'assets/images/love.png'),
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
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    var sidePadding = sizeInfo.sideSpacingOnly;
    var sentenceSize = sizeInfo.headerSubtitleSize;
    return ScaleTransition(
      scale: _scaleIn,
      child: FadeTransition(
        opacity: _fadeIn,
        child: Padding(
          padding: sidePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                sentence.assetPath,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              Text(sentence.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: sentenceSize)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(sentence.title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: sentenceSize)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
