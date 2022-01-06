import 'package:flutter/material.dart';
import 'package:stoik_app/data/soci_list.dart';
import 'package:stoik_app/providers/home_provider/home_provider.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';
import 'package:share/share.dart';
import 'package:stoik_app/widgets/web_link_page/web_link.dart';
import 'package:provider/provider.dart';

class SocialsBar extends StatelessWidget {
  const SocialsBar(
      {Key? key,
      required this.socialIconSize,
      required this.socialPadding,
      required this.socialSubtitleFontSize})
      : super(key: key);
  final double socialIconSize;
  final double socialPadding;
  final double socialSubtitleFontSize;

  @override
  Widget build(BuildContext context) {
    SocialList socialList = SocialList();

    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return RowBuilder(
          itemCount: socialList.socialsListCounter,
          itemBuilder: (context, index) {
            final listItem = socialList.socials[index];
            return GestureDetector(
              onTap: () async {
                if (index == 1) {
                  provider.rateApp(context);
                } else if (index == 2) {
                  Share.share(
                      'https://play.google.com/store/apps/details?id=org.r85.stoik_app.stoik_app');
                } else {
                  await Navigator.push(
                      context,
                      CustomPageRoute(
                          child: Web(
                            link: listItem.link!,
                          ),
                          direction: AxisDirection.up));
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).indicatorColor,
                    radius: socialIconSize,
                    child: Icon(
                      listItem.icon,
                      color: Colors
                          .white, //Theme.of(context).textTheme.subtitle2!.color,
                      size: socialIconSize,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: socialPadding),
                    child: Text(
                      listItem.title!,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: socialSubtitleFontSize),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
