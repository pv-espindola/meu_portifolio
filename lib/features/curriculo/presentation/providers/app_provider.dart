import 'package:flutter/cupertino.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/features/curriculo/data/model/app_state.dart';

class AppProvider extends ChangeNotifier {
  AppState _state = AppState.empty();

  AppState get state => _state;

  void loadScreenWidth(double width){
    _state = _state.copyWith(status: AppStatus.completed, screenWidth: width);

  }

  void defineAppFlavor(BuildContext context){
    AppConfig.of(context).flavor;
  }
}
