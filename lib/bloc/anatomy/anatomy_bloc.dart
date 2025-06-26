import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/enum.dart';
import '../../model/anatomy_model.dart';
import '../../services/anatomy/anatomy_data.dart';
import 'anatomy_contract.dart';

class AnatomyBloc extends BaseBloc<AnatomyEvent, AnatomyData> {
  AnatomyBloc(this._anatomyDataService) : super(initState) {
    on<InitAnatomyEvent>(_initAnatomyEvent);
    on<LoadAnatomyDataEvent>(_loadAnatomyDataEvent);
    on<AnatomyTapEvent>(_anatomyTapEvent);
    on<FalseAnatomySelectionEvent>(_falseAnatomySelectionEvent);
    on<UpdateAnatomyInfoEvent>(_updateAnatomyInfoEvent);
    on<DeletedAnatomyEvent>(_deletedAnatomyEvent);
    on<UpdateAnatomyState>((event, emit) => emit(event.state));
  }

  final AnatomyDataService _anatomyDataService;

  static AnatomyData get initState =>
      (AnatomyDataBuilder()
            ..state = ScreenState.loading
            ..anatomyView = AnatomyViewEnum.teeth
            ..pathList = []
            ..anatomyConditionList = []
            ..anatomyTreatmentList = []
            ..errorMessage = '')
          .build();

  void _initAnatomyEvent(InitAnatomyEvent event, _) {
    add(
    UpdateAnatomyState(
      state.rebuild(
        (u) =>
            u
              ..state = ScreenState.content
              ..anatomyView = event.anatomyViewEnum,
      ),
    ),
  );
    add(LoadAnatomyDataEvent());
  }

  void _loadAnatomyDataEvent(_, __) {
    switch (state.anatomyView) {
      case AnatomyViewEnum.teeth:
        add(
          UpdateAnatomyState(
            state.rebuild(
              (u) =>
                  u
                    ..anatomyConditionList =
                        _anatomyDataService.getAnatomyConditionList()
                    ..anatomyTreatmentList =
                        _anatomyDataService.getAnatomyTreatmentList(),
            ),
          ),
        );
      case AnatomyViewEnum.heart:
        add(
          UpdateAnatomyState(
            state.rebuild(
              (u) =>
                  u
                    ..anatomyConditionList =
                        _anatomyDataService.getAnatomyHeartConditionList()
                    ..anatomyTreatmentList =
                        _anatomyDataService.getAnatomyHeartTreatmentList(),
            ),
          ),
        );
    }
  }

  void _anatomyTapEvent(AnatomyTapEvent event, __) {
    final List<AnatomyExtendedModel> updatedList = [...state.pathList];
    AnatomyExtendedModel? anatomyModel;
    final existingIndex = state.pathList.indexWhere((t) => t.id == event.id);
    if (existingIndex == -1) {
      updatedList.add(
        AnatomyExtendedModel(
          id: event.id,
          selectedColor: AppColors.secondaryGrey1,
        ),
      );
    } else {
      anatomyModel = state.pathList[existingIndex];
      updatedList.removeAt(existingIndex);
      updatedList.add(
        AnatomyExtendedModel(
          id: event.id,
          selectedColor: AppColors.secondaryGrey1,
          anatomyTreatmentModel: anatomyModel.anatomyTreatmentModel,
          anatomyConditionModel: anatomyModel.anatomyConditionModel,
          isSelected: anatomyModel.isSelected,
        ),
      );
    }
    add(
      UpdateAnatomyState(
        state.rebuild(
          (u) =>
              u
                ..pathList = updatedList
                ..currentSelectedPath =
                    existingIndex != -1
                        ? anatomyModel
                        : AnatomyExtendedModel(
                          id: event.id,
                          selectedColor: AppColors.secondaryGrey1,
                        ),
        ),
      ),
    );
  }

  void _falseAnatomySelectionEvent(_, __) {
    List<AnatomyExtendedModel> updatedList = [...state.pathList];
    final existingIndex = updatedList.indexWhere(
      (t) => t.id == state.currentSelectedPath?.id,
    );

    updatedList.removeAt(existingIndex);
    if (state.pathList[existingIndex].isSelected) {
      updatedList.add(state.currentSelectedPath!);
    }
    add(
      UpdateAnatomyState(
        state.rebuild(
          (u) =>
              u
                ..pathList = updatedList
                ..currentSelectedPath = null,
        ),
      ),
    );
  }

  void _updateAnatomyInfoEvent(UpdateAnatomyInfoEvent event, __) {
    final anatomyModelIsExist = event.anatomyPathModel;

    final existingIndex = state.pathList.indexWhere(
      (t) => t.id == anatomyModelIsExist.id,
    );

    List<AnatomyExtendedModel> updatedList = [...state.pathList];
    if (existingIndex != -1) {
      updatedList.removeAt(existingIndex);
    }

    final anatomyModel = AnatomyExtendedModel(
      id: anatomyModelIsExist.id,
      isSelected: anatomyModelIsExist.isSelected,
      anatomyConditionModel: anatomyModelIsExist.anatomyConditionModel,
      anatomyTreatmentModel: anatomyModelIsExist.anatomyTreatmentModel,
      selectedColor: anatomyModelIsExist.anatomyTreatmentModel!.selectionColor,
    );
    updatedList.add(anatomyModel);

    add(UpdateAnatomyState(state.rebuild((u) => u.pathList = updatedList)));
    dispatchViewEvent(
      NavigateScreen(AppConstants.UPDATE_ANATOMY_LIST, data: updatedList),
    );
  }

  void _deletedAnatomyEvent(_, __) {
    List<AnatomyExtendedModel> updatedList = [...state.pathList];
    final existingIndex = state.pathList.indexWhere(
      (t) => t.id == state.currentSelectedPath?.id,
    );
    updatedList.removeAt(existingIndex);

    add(UpdateAnatomyState(state.rebuild((u) => u.pathList = updatedList)));
  }
}
