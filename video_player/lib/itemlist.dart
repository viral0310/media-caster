import 'package:flutter/material.dart';

class Category {
  String name;
  Color color;
  String link1;
  String link2;
  String link3;
  String link4;
  String routs;

  Category(
      {required this.name,
      required this.color,
      required this.link1,
      required this.link2,
      required this.link3,
      required this.link4,
      required this.routs});
}

class Global {
  static List<Category> cats = [
    Category(
      name: 'Nature',
      color: Colors.pink,
      routs: '/nature',
      link1:
          'https://elements.envato.com/beautiful-nature-norway-VN5EQSR?utm_source=mixkit&utm_medium=referral&utm_campaign=elements_mixkit_cs_video_tag_results&_ga=2.180612455.1307971905.1662983696-1362812182.1662983696',
      link2:
          'https://assets.mixkit.co/videos/preview/mixkit-going-down-a-curved-highway-through-a-mountain-range-41576-large.mp4',
      link3:
          'https://elements.envato.com/sao-lorenco-nature-reserve-on-madeira-portugal-36UQC3X?utm_source=mixkit&utm_medium=referral&utm_campaign=elements_mixkit_cs_video_tag_results&_ga=2.217680342.1307971905.1662983696-1362812182.1662983696',
      link4:
          'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
    ),
    Category(
        name: 'Spot',
        color: Colors.teal,
        routs: '/spot',
        link1: 'link1',
        link2: 'link2',
        link3: 'link3',
        link4: 'link4'),
    Category(
        name: 'Game',
        color: Colors.yellow,
        routs: '/game',
        link1: 'link1',
        link2: 'link2',
        link3: 'link3',
        link4: 'link4'),
    Category(
        name: 'Fruit',
        color: Colors.blue,
        routs: '/fruit',
        link1: 'link1',
        link2: 'link2',
        link3: 'link3',
        link4: 'link4'),
    Category(
        name: 'City',
        color: Colors.redAccent,
        routs: '/city',
        link1: 'ink1',
        link2: 'link2',
        link3: 'link',
        link4: 'link4'),
    /*  {
      'name': 'Spot',
      'color': Colors.teal,
      'link1': '',
      'lick2': '',
      'link3': '',
      'lick4': '',
    },
    {
      'name': 'Game',
      'color': Colors.yellow,
      'link1': '',
      'lick2': '',
      'link3': '',
      'lick4': '',
    },
    {
      'name': 'Product',
      'color': Colors.blue,
      'link1': '',
      'lick2': '',
      'link3': '',
      'lick4': '',
    },
    {
      'name': 'City',
      'color': Colors.redAccent,
      'link1': '',
      'lick2': '',
      'link3': '',
      'lick4': '',
    },*/
  ];
}
