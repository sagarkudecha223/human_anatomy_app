import 'package:flutter/material.dart';

import '../../localization/base_localization.dart';
import 'colors.dart';
import 'constants.dart';
import 'enum.dart';
import 'images.dart';

extension AppLoaderThemeColor on AppLoaderTheme {
  Color get backgroundColor {
    switch (this) {
      case AppLoaderTheme.light:
        return AppColors.primary;
      case AppLoaderTheme.dark:
        return AppColors.secondary;
    }
  }

  Color get valueColor {
    switch (this) {
      case AppLoaderTheme.light:
        return AppColors.lightBackground;
      case AppLoaderTheme.dark:
        return AppColors.darkBackground;
    }
  }
}

extension SharedPreferenceStoreExtractor on SharedPreferenceStore {
  String get preferenceKey => name;

  Type get getRuntimeType {
    switch (this) {
      case SharedPreferenceStore.IS_LIGHT_THEME_MODE:
        return bool;
    }
  }
}

extension HeartAnatomyInfoExtension on HeartAnatomyInfoEnum {
  String get title {
    switch (this) {
      case HeartAnatomyInfoEnum.superiorVenaCava:
        return AppLocalization.currentLocalization().superiorVenaCava;
      case HeartAnatomyInfoEnum.pulmonaryVein:
        return AppLocalization.currentLocalization().pulmonaryVein;
      case HeartAnatomyInfoEnum.rightAtrium:
        return AppLocalization.currentLocalization().rightAtrium;
      case HeartAnatomyInfoEnum.pulmonaryValve:
        return AppLocalization.currentLocalization().pulmonaryValve;
      case HeartAnatomyInfoEnum.tricuspidValve:
        return AppLocalization.currentLocalization().tricuspidValve;
      case HeartAnatomyInfoEnum.inferiorVenaCava:
        return AppLocalization.currentLocalization().inferiorVenaCava;
      case HeartAnatomyInfoEnum.rightVentricle:
        return AppLocalization.currentLocalization().rightVentricle;
      case HeartAnatomyInfoEnum.aorta:
        return AppLocalization.currentLocalization().aorta;
      case HeartAnatomyInfoEnum.pulmonaryArtery:
        return AppLocalization.currentLocalization().pulmonaryArtery;
      case HeartAnatomyInfoEnum.leftAtrium:
        return AppLocalization.currentLocalization().leftAtrium;
      case HeartAnatomyInfoEnum.mitralValve:
        return AppLocalization.currentLocalization().mitralValve;
      case HeartAnatomyInfoEnum.aorticValve:
        return AppLocalization.currentLocalization().aorticValve;
      case HeartAnatomyInfoEnum.leftVentricle:
        return AppLocalization.currentLocalization().leftVentricle;
      case HeartAnatomyInfoEnum.internalSurface:
        return AppLocalization.currentLocalization().internalSurface;
    }
  }

  static HeartAnatomyInfoEnum getEnumFromId(int id) {
    switch (id) {
      case AppConstants.SUPERIOR_VENA_CAVA:
        return HeartAnatomyInfoEnum.superiorVenaCava;

      case AppConstants.PULMONARY_VEIN:
        return HeartAnatomyInfoEnum.pulmonaryVein;

      case AppConstants.RIGHT_ATRIUM:
        return HeartAnatomyInfoEnum.rightAtrium;

      case AppConstants.PULMONARY_VALVE:
        return HeartAnatomyInfoEnum.pulmonaryValve;

      case AppConstants.TRICUSPID_VALVE:
        return HeartAnatomyInfoEnum.tricuspidValve;
      case AppConstants.INFERIOR_VENA_CAVA:
        return HeartAnatomyInfoEnum.inferiorVenaCava;
      case AppConstants.RIGHT_VENTRICLE:
        return HeartAnatomyInfoEnum.rightVentricle;

      case AppConstants.AORTA:
        return HeartAnatomyInfoEnum.aorta;

      case AppConstants.PULMONARY_ARTERY:
        return HeartAnatomyInfoEnum.pulmonaryArtery;

      case AppConstants.LEFT_ATRIUM:
        return HeartAnatomyInfoEnum.leftAtrium;

      case AppConstants.MITRAL_VALVE:
        return HeartAnatomyInfoEnum.mitralValve;
      case AppConstants.AORTIC_VALVE:
        return HeartAnatomyInfoEnum.aorticValve;
      case AppConstants.LEFT_VENTRICLE:
        return HeartAnatomyInfoEnum.leftVentricle;

      case AppConstants.INTERNAL_SURFACE:
        return HeartAnatomyInfoEnum.internalSurface;

      default:
        return HeartAnatomyInfoEnum.internalSurface;
    }
  }
}

extension DentalAnatomyInfoExtension on DentalAnatomyInfoEnum {
  String get title {
    switch (this) {
      case DentalAnatomyInfoEnum.teeth_1:
        return AppLocalization.currentLocalization().teeth_1;
      case DentalAnatomyInfoEnum.teeth_2:
        return AppLocalization.currentLocalization().teeth_2;
      case DentalAnatomyInfoEnum.teeth_3:
        return AppLocalization.currentLocalization().teeth_3;
      case DentalAnatomyInfoEnum.teeth_4:
        return AppLocalization.currentLocalization().teeth_4;
      case DentalAnatomyInfoEnum.teeth_5:
        return AppLocalization.currentLocalization().teeth_5;
      case DentalAnatomyInfoEnum.teeth_6:
        return AppLocalization.currentLocalization().teeth_6;
      case DentalAnatomyInfoEnum.teeth_7:
        return AppLocalization.currentLocalization().teeth_7;
      case DentalAnatomyInfoEnum.teeth_8:
        return AppLocalization.currentLocalization().teeth_8;
      case DentalAnatomyInfoEnum.teeth_9:
        return AppLocalization.currentLocalization().teeth_9;
      case DentalAnatomyInfoEnum.teeth_10:
        return AppLocalization.currentLocalization().teeth_10;
      case DentalAnatomyInfoEnum.teeth_11:
        return AppLocalization.currentLocalization().teeth_11;
      case DentalAnatomyInfoEnum.teeth_12:
        return AppLocalization.currentLocalization().teeth_12;
      case DentalAnatomyInfoEnum.teeth_13:
        return AppLocalization.currentLocalization().teeth_13;
      case DentalAnatomyInfoEnum.teeth_14:
        return AppLocalization.currentLocalization().teeth_14;
      case DentalAnatomyInfoEnum.teeth_15:
        return AppLocalization.currentLocalization().teeth_15;
      case DentalAnatomyInfoEnum.teeth_16:
        return AppLocalization.currentLocalization().teeth_16;
      case DentalAnatomyInfoEnum.teeth_17:
        return AppLocalization.currentLocalization().teeth_17;
      case DentalAnatomyInfoEnum.teeth_18:
        return AppLocalization.currentLocalization().teeth_18;
      case DentalAnatomyInfoEnum.teeth_19:
        return AppLocalization.currentLocalization().teeth_19;
      case DentalAnatomyInfoEnum.teeth_20:
        return AppLocalization.currentLocalization().teeth_20;
      case DentalAnatomyInfoEnum.teeth_21:
        return AppLocalization.currentLocalization().teeth_21;
      case DentalAnatomyInfoEnum.teeth_22:
        return AppLocalization.currentLocalization().teeth_22;
      case DentalAnatomyInfoEnum.teeth_23:
        return AppLocalization.currentLocalization().teeth_23;
      case DentalAnatomyInfoEnum.teeth_24:
        return AppLocalization.currentLocalization().teeth_24;
      case DentalAnatomyInfoEnum.teeth_25:
        return AppLocalization.currentLocalization().teeth_25;
      case DentalAnatomyInfoEnum.teeth_26:
        return AppLocalization.currentLocalization().teeth_26;
      case DentalAnatomyInfoEnum.teeth_27:
        return AppLocalization.currentLocalization().teeth_27;
      case DentalAnatomyInfoEnum.teeth_28:
        return AppLocalization.currentLocalization().teeth_28;
      case DentalAnatomyInfoEnum.teeth_29:
        return AppLocalization.currentLocalization().teeth_29;
      case DentalAnatomyInfoEnum.teeth_30:
        return AppLocalization.currentLocalization().teeth_30;
      case DentalAnatomyInfoEnum.teeth_31:
        return AppLocalization.currentLocalization().teeth_31;
      case DentalAnatomyInfoEnum.teeth_32:
        return AppLocalization.currentLocalization().teeth_32;
    }
  }

  static DentalAnatomyInfoEnum getEnumFromId(int id) {
    switch (id) {
      case AppConstants.TEETH_1:
        return DentalAnatomyInfoEnum.teeth_1;

      case AppConstants.TEETH_2:
        return DentalAnatomyInfoEnum.teeth_2;

      case AppConstants.TEETH_3:
        return DentalAnatomyInfoEnum.teeth_3;

      case AppConstants.TEETH_4:
        return DentalAnatomyInfoEnum.teeth_4;

      case AppConstants.TEETH_5:
        return DentalAnatomyInfoEnum.teeth_5;

      case AppConstants.TEETH_6:
        return DentalAnatomyInfoEnum.teeth_6;

      case AppConstants.TEETH_7:
        return DentalAnatomyInfoEnum.teeth_7;
      case AppConstants.TEETH_8:
        return DentalAnatomyInfoEnum.teeth_8;

      case AppConstants.TEETH_9:
        return DentalAnatomyInfoEnum.teeth_9;

      case AppConstants.TEETH_10:
        return DentalAnatomyInfoEnum.teeth_10;

      case AppConstants.TEETH_11:
        return DentalAnatomyInfoEnum.teeth_11;

      case AppConstants.TEETH_12:
        return DentalAnatomyInfoEnum.teeth_12;

      case AppConstants.TEETH_13:
        return DentalAnatomyInfoEnum.teeth_13;

      case AppConstants.TEETH_14:
        return DentalAnatomyInfoEnum.teeth_14;

      case AppConstants.TEETH_15:
        return DentalAnatomyInfoEnum.teeth_15;

      case AppConstants.TEETH_16:
        return DentalAnatomyInfoEnum.teeth_16;

      case AppConstants.TEETH_17:
        return DentalAnatomyInfoEnum.teeth_17;
      case AppConstants.TEETH_18:
        return DentalAnatomyInfoEnum.teeth_18;

      case AppConstants.TEETH_19:
        return DentalAnatomyInfoEnum.teeth_19;

      case AppConstants.TEETH_20:
        return DentalAnatomyInfoEnum.teeth_20;

      case AppConstants.TEETH_21:
        return DentalAnatomyInfoEnum.teeth_21;

      case AppConstants.TEETH_22:
        return DentalAnatomyInfoEnum.teeth_22;

      case AppConstants.TEETH_23:
        return DentalAnatomyInfoEnum.teeth_23;

      case AppConstants.TEETH_24:
        return DentalAnatomyInfoEnum.teeth_24;

      case AppConstants.TEETH_25:
        return DentalAnatomyInfoEnum.teeth_25;

      case AppConstants.TEETH_26:
        return DentalAnatomyInfoEnum.teeth_26;

      case AppConstants.TEETH_27:
        return DentalAnatomyInfoEnum.teeth_27;
      case AppConstants.TEETH_28:
        return DentalAnatomyInfoEnum.teeth_28;

      case AppConstants.TEETH_29:
        return DentalAnatomyInfoEnum.teeth_29;

      case AppConstants.TEETH_30:
        return DentalAnatomyInfoEnum.teeth_30;

      case AppConstants.TEETH_31:
        return DentalAnatomyInfoEnum.teeth_31;

      case AppConstants.TEETH_32:
        return DentalAnatomyInfoEnum.teeth_32;

      default:
        return DentalAnatomyInfoEnum.teeth_1;
    }
  }
}

extension AnatomyViewExtension on AnatomyViewEnum {
  String get title {
    switch (this) {
      case AnatomyViewEnum.teeth:
        return AppLocalization.currentLocalization().teeth;
      case AnatomyViewEnum.heart:
        return AppLocalization.currentLocalization().heart;
    }
  }

  String get image {
    switch (this) {
      case AnatomyViewEnum.teeth:
        return Images.toothView;
      case AnatomyViewEnum.heart:
        return Images.heartView;
    }
  }

  String getSelectedPathName(int id, AnatomyViewEnum view) {
    switch (view) {
      case AnatomyViewEnum.teeth:
        return DentalAnatomyInfoExtension.getEnumFromId(id).title;
      case AnatomyViewEnum.heart:
        return HeartAnatomyInfoExtension.getEnumFromId(id).title;
    }
  }

  String get icon {
    switch (this) {
      case AnatomyViewEnum.teeth:
        return Images.tooth;
      case AnatomyViewEnum.heart:
        return Images.heartIcon;
    }
  }
}
