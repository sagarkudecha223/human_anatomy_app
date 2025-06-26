import '../../model/anatomy_condition_model.dart';
import '../../model/anatomy_treatment_model.dart';
import 'anatomy_mock_data.dart';

class AnatomyDataService {
  final AnatomyMockData _anatomyMockData;

  AnatomyDataService(this._anatomyMockData);

  List<AnatomyConditionModel> getAnatomyConditionList() =>
      _anatomyMockData.getDentalAnatomyConditionList();

  List<AnatomyTreatmentModel> getAnatomyTreatmentList() =>
      _anatomyMockData.getDentalAnatomyTreatmentList();

  List<AnatomyConditionModel> getAnatomyHeartConditionList() =>
      _anatomyMockData.getHeartAnatomyConditionList();

  List<AnatomyTreatmentModel> getAnatomyHeartTreatmentList() =>
      _anatomyMockData.getHeartAnatomyTreatmentList();
}
