import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/providers/onboarding_provider/onboarding_provider.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';

class IntroB extends StatelessWidget {
  const IntroB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/menu.png',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Text(
                'Po lewej stronie aplikacji \nznajduje się pasek menu:',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              ColumnBuilder(
                itemCount: provider.menuLearnListCounter,
                itemBuilder: (context, index) {
                  final menuIntro = provider.menuLearnList[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: index % 2 == 1
                            ? Theme.of(context).focusColor
                            : Theme.of(context).primaryColorDark,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                              color: Colors.white,
                              height: 1.2,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                          maxLines: 15,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text: '${menuIntro.title} \n',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      height: 1.2,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${menuIntro.description} \n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          height: 1.2,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 12),
                                )
                              ]),
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
