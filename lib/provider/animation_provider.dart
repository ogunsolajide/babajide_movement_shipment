import 'package:flutter/cupertino.dart';

class AnimationProvider extends ChangeNotifier {
  bool _homefirstAppBar = true;
  bool get homefirstAppBar => _homefirstAppBar;



  void enableHomeAppBar(bool status,context){
    _homefirstAppBar = status;
    notifyListeners();
  }
}