import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';

import '../../core/routes.dart';
import '../../services/theme_service/theme_service.dart';
import 'home_contract.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeData> {
  HomeBloc(this._themeService) : super(initState) {
    on<InitHomeEvent>(_initHomeEvent);
    on<CardTapEvent>(_cardTapEvent);
    on<ChangeThemeEvent>(_changeTheme);
    on<UpdateHomeState>((event, emit) => emit(event.state));
  }

  final ThemeService _themeService;

  static HomeData get initState =>
      (HomeDataBuilder()
            ..state = ScreenState.content
            ..errorMessage = '')
          .build();

  void _initHomeEvent(_, __) {}

  void _changeTheme(_, __) {
    _themeService.changeThemeMode();
    add(UpdateHomeState(state.rebuild((u) {})));
  }

  void _cardTapEvent(CardTapEvent event, __) => dispatchViewEvent(
    NavigateScreen(AppRoutes.anatomyView, data: event.anatomyViewEnum),
  );
}
