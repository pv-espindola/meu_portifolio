import 'package:flutter/cupertino.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/features/curriculo/data/model/app_state.dart';

import '../../../meta/presentation/ui/pages/home_meta_section.dart';
import '../ui/pages/home_curriculo_section.dart';

class AppProvider extends ChangeNotifier {
  AppState _state = AppState.empty();

  AppState get state => _state;
  int _curriculoFlex = 3;
  int _metaFlex = 2;
  final PageController _homePageController = PageController();
  PageController get pageController => _homePageController;
  int get curriculoFlex => _curriculoFlex;
  int get metaFlex => _metaFlex;
  bool get layoutButtonValue => _state.layoutStyle == LayoutStyle.metaExpanded;
  final _pages = [const HomeCurriculoSection(), const HomeMetaSection()];
  get pages => _pages;
  void loadScreenWidth(double width){
    _state = _state.copyWith(status: AppStatus.completed, screenWidth: width);

  }

  void moveToMeta(){
    _homePageController.animateToPage(1,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut);
  }

  void moveToCurriculo(){
    _homePageController.animateToPage(0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut);
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
