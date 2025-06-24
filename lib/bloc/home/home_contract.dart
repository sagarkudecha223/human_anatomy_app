import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';

import '../../core/enum.dart';

part 'home_contract.g.dart';

abstract class HomeData implements Built<HomeData, HomeDataBuilder> {
  factory HomeData([void Function(HomeDataBuilder) updates]) = _$HomeData;

  HomeData._();

  ScreenState get state;

  String? get errorMessage;
}

abstract class HomeEvent {}

class InitHomeEvent extends HomeEvent {}

class ChangeThemeEvent extends HomeEvent {}

class CardTapEvent extends HomeEvent {
  final AnatomyViewEnum anatomyViewEnum;

  CardTapEvent({required this.anatomyViewEnum});
}

class UpdateHomeState extends HomeEvent {
  final HomeData state;

  UpdateHomeState(this.state);
}
