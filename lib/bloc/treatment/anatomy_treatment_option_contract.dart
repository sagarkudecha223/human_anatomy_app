import 'package:flutter_base_architecture_plugin/core/screen_state.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';

import '../../core/enum.dart';
import '../../model/anatomy_condition_model.dart';
import '../../model/anatomy_model.dart';
import '../../model/anatomy_treatment_model.dart';

part 'anatomy_treatment_option_contract.g.dart';

abstract class AnatomyTreatmentOptionData
    implements
        Built<AnatomyTreatmentOptionData, AnatomyTreatmentOptionDataBuilder> {
  factory AnatomyTreatmentOptionData(
          [void Function(AnatomyTreatmentOptionDataBuilder) updates]) =
      _$AnatomyTreatmentOptionData;

  AnatomyTreatmentOptionData._();

  ScreenState get state;

  AnatomyConditionModel? get anatomyConditionModel;

  AnatomyTreatmentModel? get anatomyTreatmentModel;

  List<AnatomyConditionModel> get anatomyConditionList;

  List<AnatomyTreatmentModel> get anatomyTreatmentList;

  AnatomyExtendedModel get pathModel;

  String? get note;

  AnatomyViewEnum? get anatomyViewEnum;

  String? get errorMessage;
}

abstract class AnatomyTreatmentOptionEvent {}

class InitAnatomyTreatmentOptionEvent extends AnatomyTreatmentOptionEvent {
  final AnatomyExtendedModel pathModel;
  final List<AnatomyConditionModel>  anatomyConditionList;
  final List<AnatomyTreatmentModel> anatomyTreatmentList;
  final AnatomyViewEnum? anatomyViewEnum;

  InitAnatomyTreatmentOptionEvent({required this.pathModel,required this.anatomyConditionList,required this.anatomyTreatmentList,required this.anatomyViewEnum});
}

class ConditionChangeEvent extends AnatomyTreatmentOptionEvent {
  final AnatomyConditionModel anatomyConditionModel;

  ConditionChangeEvent({required this.anatomyConditionModel});
}

class TreatmentChangeEvent extends AnatomyTreatmentOptionEvent {
  final AnatomyTreatmentModel anatomyTreatmentModel;

  TreatmentChangeEvent({required this.anatomyTreatmentModel});
}

class NoteTextChangeEvent extends AnatomyTreatmentOptionEvent {
  final String text;

  NoteTextChangeEvent({required this.text});
}

class SaveButtonTapEvent extends AnatomyTreatmentOptionEvent {}

class DeletedAnatomyEvent extends AnatomyTreatmentOptionEvent {}

class UpdateAnatomyTreatmentOptionState extends AnatomyTreatmentOptionEvent {
  final AnatomyTreatmentOptionData state;

  UpdateAnatomyTreatmentOptionState(this.state);
}
