import 'dart:collection';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stoik_app/model/soci_model.dart';

class SocialList {
  final List<SocialModel> _socialList = [
    SocialModel(
        title: "www",
        icon: FontAwesomeIcons.globe,
        link: 'https://stoikapp.herokuapp.com/'),
    SocialModel(
        title: "dodaj opinie",
        icon: FontAwesomeIcons.googlePlay,
        link: 'https://www.facebook.com'),
    SocialModel(title: "udostępnij", icon: FontAwesomeIcons.share, link: ''),
  ];

  UnmodifiableListView<SocialModel> get socials {
    return UnmodifiableListView(_socialList);
  }

  int get socialsListCounter {
    return _socialList.length;
  }
}
