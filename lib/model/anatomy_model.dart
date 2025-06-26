import 'package:flutter/material.dart';

import 'anatomy_condition_model.dart';
import 'anatomy_treatment_model.dart';

class AnatomyExtendedModel{
  final String id;
  final Color? selectedColor;
  final AnatomyConditionModel? anatomyConditionModel;
  final AnatomyTreatmentModel? anatomyTreatmentModel;
  final bool isSelected;

  AnatomyExtendedModel({
    required this.id,
    this.selectedColor,
    this.isSelected = false,
    this.anatomyConditionModel,
    this.anatomyTreatmentModel,
  });
}
