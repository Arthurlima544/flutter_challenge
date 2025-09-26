import 'package:flutter/widgets.dart';

List<double> commonAspectRatios = <double>[
  16 / 9,
  18 / 9,
  19.5 / 9,
  4 / 3,
  3 / 2,
  21 / 9,
];

List<double> commonDPRs = <double>[1.0, 1.5, 2.0];

Map<String, List<Size>> devicesSizes = <String, List<Size>>{
  'watches': <Size>[const Size(162, 197)],
  'phones': <Size>[const Size(390, 844)],
  'tablets': <Size>[const Size(768, 1024)],
  'notebooks': <Size>[const Size(1440, 900)],
  'bigscreens': <Size>[const Size(3840, 2160)],
};
