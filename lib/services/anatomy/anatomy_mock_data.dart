import '../../core/colors.dart';
import '../../model/anatomy_condition_model.dart';
import '../../model/anatomy_treatment_model.dart';

class AnatomyMockData {
  List<AnatomyConditionModel> getDentalAnatomyConditionList() {
    return [
      const AnatomyConditionModel(id: 1, name: 'Caries', shortForm: 'car'),
      const AnatomyConditionModel(
        id: 2,
        name: 'Informed Refusal',
        shortForm: 'pre',
      ),
      const AnatomyConditionModel(id: 3, name: 'Un-erupted', shortForm: 'une'),
      const AnatomyConditionModel(
        id: 4,
        name: 'Impacted visible',
        shortForm: 'imv',
      ),
      const AnatomyConditionModel(id: 5, name: 'Anomali', shortForm: 'ano'),
    ];
  }

  List<AnatomyTreatmentModel> getDentalAnatomyTreatmentList() {
    return [
      const AnatomyTreatmentModel(
        id: 1,
        name: 'Teeth Whitening',
        selectionColor: TreatmentColor.pastelBlue,
      ),
      const AnatomyTreatmentModel(
        id: 2,
        name: 'Teeth Cleaning',
        selectionColor: TreatmentColor.mutedPeach,
      ),
      const AnatomyTreatmentModel(
        id: 3,
        name: 'Teeth Fillings',
        selectionColor: TreatmentColor.lavender,
      ),
      const AnatomyTreatmentModel(
        id: 4,
        name: 'Teeth Extraction',
        selectionColor: TreatmentColor.softGreen,
      ),
      const AnatomyTreatmentModel(
        id: 5,
        name: 'Crowns',
        selectionColor: TreatmentColor.softPink,
      ),
    ];
  }

  List<AnatomyConditionModel> getHeartAnatomyConditionList() {
    return [
      const AnatomyConditionModel(
        id: 1,
        name: 'Heart Failure',
        shortForm: 'hf',
      ),
      const AnatomyConditionModel(
        id: 2,
        name: 'Heart Rhythm Disorders',
        shortForm: 'hrd',
      ),
      const AnatomyConditionModel(
        id: 3,
        name: 'Heart Valve Diseases',
        shortForm: 'hvd',
      ),
      const AnatomyConditionModel(
        id: 4,
        name: 'Cardiomyopathies',
        shortForm: 'card',
      ),
      const AnatomyConditionModel(
        id: 5,
        name: 'Vascular Diseases',
        shortForm: 'vad',
      ),
    ];
  }

  List<AnatomyTreatmentModel> getHeartAnatomyTreatmentList() {
    return [
      const AnatomyTreatmentModel(
        id: 1,
        name: 'Coronary Artery Bypass',
        selectionColor: TreatmentColor.pastelBlue,
      ),
      const AnatomyTreatmentModel(
        id: 2,
        name: 'Valve Repair or Replacement',
        selectionColor: TreatmentColor.mutedPeach,
      ),
      const AnatomyTreatmentModel(
        id: 3,
        name: 'Heart Transplant',
        selectionColor: TreatmentColor.lavender,
      ),
      const AnatomyTreatmentModel(
        id: 4,
        name: 'Left Ventricular Assist Device',
        selectionColor: TreatmentColor.softGreen,
      ),
      const AnatomyTreatmentModel(
        id: 5,
        name: 'Open-Heart Surgery',
        selectionColor: TreatmentColor.softPink,
      ),
    ];
  }
}
