import 'package:flutter/material.dart';
import 'package:stoik_app/model/learning_model.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key, required this.learnData}) : super(key: key);

  final LearnModel learnData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(learnData.title),
            SizedBox(
              height: 30,
            ),
            Text('''${learnData.description}'''),
            SizedBox(
              height: 20,
            ),
            FlatBtn(
              title: 'Back',
              onPress: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
