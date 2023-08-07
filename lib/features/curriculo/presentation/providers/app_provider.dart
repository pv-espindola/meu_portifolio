import 'package:flutter/cupertino.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/features/curriculo/data/model/app_state.dart';

class AppProvider extends ChangeNotifier {
  AppState _state = AppState.empty();

  AppState get state => _state;
  int _curriculoFlex = 3;
  int _metaFlex = 2;

  int get curriculoFlex => _curriculoFlex;
  int get metaFlex => _metaFlex;
  bool get layoutValue => _state.layoutStyle == LayoutStyle.metaExpanded;


  void loadScreenWidth(double width){
    _state = _state.copyWith(status: AppStatus.completed, screenWidth: width);

  }

  void layoutChange(bool value){
    _state = _state.copyWith(
        layoutStyle: value?
        LayoutStyle.metaExpanded
            : LayoutStyle.curriculoExpanded);
    _curriculoFlex = value? 2 : 3;
    _metaFlex = value? 3 : 2;

    notifyListeners();

  }


}
