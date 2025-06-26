import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';
import '../../../localization/base_localization.dart';
import '../../core/routes.dart';
import '../../model/anatomy_model.dart';
import 'anatomy_treatment_option_contract.dart';

class AnatomyTreatmentOptionBloc
    extends BaseBloc<AnatomyTreatmentOptionEvent, AnatomyTreatmentOptionData> {
  AnatomyTreatmentOptionBloc() : super(initState) {
    on<InitAnatomyTreatmentOptionEvent>(_initAnatomyTreatmentOptionEvent);
    on<ConditionChangeEvent>(_conditionChangeEvent);
    on<TreatmentChangeEvent>(_treatmentChangeEvent);
    on<NoteTextChangeEvent>(_noteTextChangeEvent);
    on<SaveButtonTapEvent>(_saveButtonTapEvent);
    on<DeletedAnatomyEvent>(_deletedAnatomyEvent);
    on<UpdateAnatomyTreatmentOptionState>((event, emit) => emit(event.state));
  }

  static AnatomyTreatmentOptionData get initState =>
      (AnatomyTreatmentOptionDataBuilder()
            ..state = ScreenState.loading
            ..pathModel = AnatomyExtendedModel(id: '0')
            ..anatomyConditionList = []
            ..anatomyTreatmentList = []
            ..errorMessage = '')
          .build();

  void _initAnatomyTreatmentOptionEvent(
    InitAnatomyTreatmentOptionEvent event,
    _,
  ) => add(
    UpdateAnatomyTreatmentOptionState(
      state.rebuild(
        (u) =>
            u
              ..anatomyConditionModel = event.pathModel.anatomyConditionModel
              ..anatomyTreatmentModel = event.pathModel.anatomyTreatmentModel
              ..anatomyConditionList = event.anatomyConditionList
              ..anatomyTreatmentList = event.anatomyTreatmentList
              ..pathModel = event.pathModel
              ..anatomyViewEnum = event.anatomyViewEnum
              ..state = ScreenState.content,
      ),
    ),
  );

  void _conditionChangeEvent(ConditionChangeEvent event, __) => add(
    UpdateAnatomyTreatmentOptionState(
      state.rebuild(
        (u) => u.anatomyConditionModel = event.anatomyConditionModel,
      ),
    ),
  );

  void _treatmentChangeEvent(TreatmentChangeEvent event, __) => add(
    UpdateAnatomyTreatmentOptionState(
      state.rebuild(
        (u) => u.anatomyTreatmentModel = event.anatomyTreatmentModel,
      ),
    ),
  );

  void _noteTextChangeEvent(NoteTextChangeEvent event, __) => add(
    UpdateAnatomyTreatmentOptionState(
      state.rebuild((u) => u.note = event.text),
    ),
  );

  void _saveButtonTapEvent(_, __) {
    if (state.anatomyTreatmentModel != null) {
      final anatomyModel = AnatomyExtendedModel(
        id: state.pathModel.id,
        isSelected: true,
        anatomyConditionModel: state.anatomyConditionModel,
        anatomyTreatmentModel: state.anatomyTreatmentModel,
      );
      dispatchViewEvent(
        NavigateScreen(AppRoutes.closeTreatmentOption, data: anatomyModel),
      );
    } else {
      dispatchViewEvent(
        DisplayMessage(
          type: DisplayMessageType.toast,
          message: AppLocalization.currentLocalization().kindlySelectTreatment,
        ),
      );
    }
  }

  void _deletedAnatomyEvent(_, __) => dispatchViewEvent(
    NavigateScreen(AppRoutes.closeTreatmentOption, data: true),
  );
}
