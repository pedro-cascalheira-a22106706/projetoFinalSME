import 'package:flutter/cupertino.dart';
import 'package:projeto_final/core/enums/enums.dart';

class BaseViewModel extends ChangeNotifier{
  ViewState _state = ViewState.idle;

  ViewState get state => _state;
  setState(ViewState state){
    _state = state;
    notifyListeners();
  }
}