import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';
import 'package:flutter_base_architecture_plugin/imports/localization_imports.dart';

abstract class AppLocalization extends BaseLocalization {
  AppLocalization({
    required super.code,
    required super.name,
    super.country,
  });

  static AppLocalization currentLocalization() =>
      Localization.currentLocalization as AppLocalization;

  String get retry;

  String get ok;

  String get partialErupted;

  String get unErupted;

  String get impactedVisible;

  String get caries;

  String get informedRefusal;

  String get anomali;

  String get teethWhitening;

  String get teethCleaning;

  String get teethFillings;

  String get teethExtraction;

  String get crowns;

  String get selectCondition;

  String get selectTreatment;

  String get single;

  String get multi;

  String get note;

  String get save;

  String get kindlySelectTreatment;

  String get undo;

  String get redo;

  String get eraser;

  String get delete;

  String get heartFailure;

  String get heartRhythmDisorders;

  String get heartValveDiseases;

  String get cardiomyopathies;

  String get vascularDiseases;

  String get coronaryArteryBypass;

  String get valveRepair;

  String get heartTransplant;

  String get leftVentricularAssistDevice;

  String get openHeartSurgery;

  String get superiorVenaCava;

  String get pulmonaryVein;

  String get rightAtrium;

  String get pulmonaryValve;

  String get tricuspidValve;

  String get inferiorVenaCava;

  String get rightVentricle;

  String get aorta;

  String get pulmonaryArtery;

  String get leftAtrium;

  String get mitralValve;

  String get aorticValve;

  String get leftVentricle;

  String get internalSurface;

  String get teeth;

  String get heart;

  String get invalidURL;
  String get teeth_1;

  String get teeth_2;

  String get teeth_3;

  String get teeth_4;

  String get teeth_5;

  String get teeth_6;

  String get teeth_7;

  String get teeth_8;

  String get teeth_9;

  String get teeth_10;

  String get teeth_11;

  String get teeth_12;

  String get teeth_13;

  String get teeth_14;

  String get teeth_15;

  String get teeth_16;

  String get teeth_17;

  String get teeth_18;

  String get teeth_19;

  String get teeth_20;

  String get teeth_21;

  String get teeth_22;

  String get teeth_23;

  String get teeth_24;

  String get teeth_25;

  String get teeth_26;

  String get teeth_27;

  String get teeth_28;

  String get teeth_29;

  String get teeth_30;

  String get teeth_31;

  String get teeth_32;

  String get humanAnatomy;

}
