import 'package:flutter_base_architecture_plugin/core/screen_state.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';

import '../../core/enum.dart';
import '../../model/anatomy_condition_model.dart';
import '../../model/anatomy_model.dart';
import '../../model/anatomy_treatment_model.dart';

part 'anatomy_contract.g.dart';

abstract class AnatomyData implements Built<AnatomyData, AnatomyDataBuilder> {
  factory AnatomyData([void Function(AnatomyDataBuilder) updates]) =
      _$AnatomyData;

  AnatomyData._();

  ScreenState get state;

  List<AnatomyExtendedModel> get pathList;

  List<AnatomyConditionModel> get anatomyConditionList;

  List<AnatomyTreatmentModel> get anatomyTreatmentList;

  AnatomyViewEnum get anatomyView;

  AnatomyExtendedModel? get currentSelectedPath;

  String? get errorMessage;
}

abstract class AnatomyEvent {}

class InitAnatomyEvent extends AnatomyEvent {
  final AnatomyViewEnum anatomyViewEnum;

  InitAnatomyEvent({required this.anatomyViewEnum});
}

class LoadAnatomyDataEvent extends AnatomyEvent {}

class AnatomyTapEvent extends AnatomyEvent {
  final String id;
  final bool isSelected;

  AnatomyTapEvent({required this.id, required this.isSelected});
}

class FalseAnatomySelectionEvent extends AnatomyEvent {}

class DeletedAnatomyEvent extends AnatomyEvent {}

class UpdateAnatomyInfoEvent extends AnatomyEvent {
  final AnatomyExtendedModel anatomyPathModel;

  UpdateAnatomyInfoEvent({required this.anatomyPathModel});
}

class UpdateAnatomyState extends AnatomyEvent {
  final AnatomyData state;

  UpdateAnatomyState(this.state);
}
