import 'package:flutter/material.dart';
import 'package:flutter_application_1/pertemuan06/pertemuan06_screen.dart';
import 'package:provider/provider.dart';

class Pertemuan06Provider extends ChangeNotifier {
  var light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.purple,
  );

  var dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.purple,
  );

  bool _enableDarkMode = false;

  bool get enableDarkMode => _enableDarkMode;

  set setBrightness(val) {
    _enableDarkMode = val;
    notifyListeners();
  }

  //show and hide
  bool _isDropdownVisible = false;

  bool get isDropdownShow => _isDropdownVisible;

  set isDropdownShow(value) {
    _isDropdownVisible = value;
    notifyListeners();
  }
}
