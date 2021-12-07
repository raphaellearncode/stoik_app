import 'package:flutter/material.dart';
import 'package:stoik_app/data/soci_list.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';
import 'package:share/share.dart';
import 'package:stoik_app/widgets/web_link_page/web_link.dart';

class SocialsBar extends StatelessWidget {
  const SocialsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var socialIconSize = 20.0; //SizeInfo.switchButtonIconSize;
    var socialSubtitleFontSize = 12.0; //SizeInfo.calendarDaySize;
    var socialPadding = 5.0; //SizeInfo.edgePadding;
    SocialList socialList = SocialList();
    return RowBuilder(
      itemCount: socialList.socialsListCounter,
      itemBuilder: (context, index) {
        final listItem = socialList.socials[index];
        return GestureDetector(
          onTap: () async {
            if (index == 2) {
              Share.share(
                  'https://play.google.com/store/apps/details?id=org.r85.calendar_todo');
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
                backgroundColor:
                    Colors.amber, //Theme.of(context).indicatorColor,
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
  }
}
