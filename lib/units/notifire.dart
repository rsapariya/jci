import 'package:flutter/material.dart';

import 'colour.dart';
import 'notifire.dart';

class ColorNotifire with ChangeNotifier {
  bool _isDark = false;
  set setIsDark(value) {
    _isDark = value;
    notifyListeners();
  }

  get getprimerycolor => _isDark ? darkPrimeryColor : primeryColor;
  get getdarkscolor => _isDark ? lightColor : darkColor;
  get getgreycolor => _isDark ? lightgreyColor : darkgreyColor;
  get getbluecolor => _isDark ? darkblueColor : lightblueColor;
  get getbox => _isDark ? darkbox : lightbox;
  get greyfont => _isDark ? greydark : greylight;
  get station => _isDark ? stationdark : stationlight;
  get bar => _isDark ? serchbaard : serchbaarl;
}
