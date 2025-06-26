import 'package:flutter/material.dart';
import 'package:flutter_base_architecture_plugin/extension/navigation_extensions.dart';
import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';
import 'package:gap/gap.dart';
import '../../../../localization/base_localization.dart';
import '../../bloc/treatment/anatomy_treatment_option_bloc.dart';
import '../../bloc/treatment/anatomy_treatment_option_contract.dart';
import '../../core/app_extension.dart';
import '../../core/colors.dart';
import '../../core/enum.dart';
import '../../core/routes.dart';
import '../../core/styles.dart';
import '../../core/toast.dart';
import '../../model/anatomy_condition_model.dart';
import '../../model/anatomy_model.dart';
import '../../model/anatomy_treatment_model.dart';
import '../common/app_drop_down.dart';
import '../common/app_loader.dart';
import '../common/app_toast.dart';
import '../common/container_decoration.dart';
import '../common/icon_button.dart';
import '../common/svg_icon.dart';
import '../common/text_button.dart';

class AnatomyTreatmentOptionScreen extends StatefulWidget {
  final AnatomyExtendedModel teethModel;
  final bool isDownSide;
  final bool isLeftSide;
  final List<AnatomyConditionModel> anatomyConditionList;
  final List<AnatomyTreatmentModel> anatomyTreatmentList;
  final AnatomyViewEnum? anatomyViewEnum;

  const AnatomyTreatmentOptionScreen({
    super.key,
    required this.teethModel,
    required this.isDownSide,
    required this.anatomyConditionList,
    required this.anatomyTreatmentList,
    required this.anatomyViewEnum,
    required this.isLeftSide,
  });

  @override
  State<AnatomyTreatmentOptionScreen> createState() =>
      _AnatomyTreatmentOptionScreenState();
}

class _AnatomyTreatmentOptionScreenState
    extends
        BaseState<AnatomyTreatmentOptionBloc, AnatomyTreatmentOptionScreen> {
  @override
  void initState() {
    super.initState();
    bloc.add(
      InitAnatomyTreatmentOptionEvent(
        pathModel: widget.teethModel,
        anatomyConditionList: widget.anatomyConditionList,
        anatomyTreatmentList: widget.anatomyTreatmentList,
        anatomyViewEnum: widget.anatomyViewEnum,
      ),
    );
  }

  @override
  void onViewEvent(ViewAction event) {
    switch (event.runtimeType) {
      case const (NavigateScreen):
        _buildHandleActionEvent(event as NavigateScreen);
      case const (DisplayMessage):
        _buildHandleMessage(event as DisplayMessage);
    }
  }

  void _buildHandleMessage(DisplayMessage displayMessage) {
    final message = displayMessage.message;
    final type = displayMessage.type;
    switch (type) {
      case DisplayMessageType.toast:
        showToast(AppToast(message: message!), context);
      default:
        break;
    }
  }

  void _buildHandleActionEvent(NavigateScreen screen) {
    switch (screen.target) {
      case AppRoutes.closeTreatmentOption:
        context.pop(screen.data);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 250,
          padding: EdgeInsets.all(12),
          decoration: ContainerDecoration(),
          child: BlocProvider<AnatomyTreatmentOptionBloc>(
            create: (_) => bloc,
            child: BlocBuilder<
              AnatomyTreatmentOptionBloc,
              AnatomyTreatmentOptionData
            >(builder: (_, __) => _MainContent(bloc: bloc)),
          ),
        ),
        Positioned(
          bottom: widget.isDownSide ? 60 : null,
          left: widget.isLeftSide ? 249.5 : null,
          child: CustomPaint(
            painter: _ArrowPainter(isLeftSide: widget.isLeftSide),
          ),
        ),
      ],
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({required this.bloc});

  final AnatomyTreatmentOptionBloc bloc;

  @override
  Widget build(BuildContext context) {
    switch (bloc.state.state) {
      case ScreenState.content:
        return _TreatmentContent(bloc: bloc);
      default:
        return const AppLoader();
    }
  }
}

class _ArrowPainter extends CustomPainter {
  final bool isLeftSide;

  _ArrowPainter({required this.isLeftSide});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppColors.iconColor
          ..style = PaintingStyle.fill;

    final path = Path();

    final borderPaint =
        Paint()
          ..color = AppColors.backgroundColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5;

    const double notchHeight = 20;
    double notchWidth = isLeftSide ? 10 : -10;
    final notchPath =
        Path()
          ..moveTo(0.5, notchHeight)
          ..relativeLineTo(notchWidth, notchHeight / 2)
          ..relativeLineTo(-notchWidth, notchHeight / 2);

    // Combine the rounded rectangle and the notch
    path.addPath(notchPath, Offset.zero);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TreatmentContent extends StatelessWidget {
  final AnatomyTreatmentOptionBloc bloc;

  const _TreatmentContent({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _AnatomyInfoView(bloc: bloc),
        Gap(14),
        _SelectConditionsView(bloc: bloc),
        Gap(14),
        _SelectTreatmentView(bloc: bloc),
        Gap(12),
        _DeleteAndSaveView(bloc: bloc),
      ],
    );
  }
}

class _AnatomyInfoView extends StatelessWidget {
  final AnatomyTreatmentOptionBloc bloc;

  const _AnatomyInfoView({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            bloc.state.anatomyViewEnum!.getSelectedPathName(
              int.parse(bloc.state.pathModel.id),
              bloc.state.anatomyViewEnum!,
            ),
            style: AppFontTextStyles.textStyleMedium().copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          decoration: ContainerDecoration(
            boxShadows: [
              BoxShadow(
                color: AppColors.shadowColor,
                spreadRadius: 0.3,
                blurRadius: 3,
                blurStyle: BlurStyle.outer,
              ),
            ],
            radius: 4,
          ),
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              AppSvgIcon(bloc.state.anatomyViewEnum?.icon ?? '', height: 12),
              Gap(8),
              Text(
                bloc.state.pathModel.id,
                style: AppFontTextStyles.textStyleSmall().copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SelectConditionsView extends StatelessWidget {
  final AnatomyTreatmentOptionBloc bloc;

  const _SelectConditionsView({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return AppDropDown(
      labelText: AppLocalization.currentLocalization().selectCondition,
      initialValue: bloc.state.anatomyConditionModel,
      textStyle: AppFontTextStyles.textStyleSmall().copyWith(fontSize: 12),
      labelTextStyle: AppFontTextStyles.textStyleSmall().copyWith(fontSize: 12),
      showInitialValue: bloc.state.anatomyConditionModel != null,
      onChanged:
          (item) =>
              bloc.add(ConditionChangeEvent(anatomyConditionModel: item!)),
      items: bloc.state.anatomyConditionList,
      itemLabel: (item) => item.name,
    );
  }
}

class _SelectTreatmentView extends StatelessWidget {
  final AnatomyTreatmentOptionBloc bloc;

  const _SelectTreatmentView({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return AppDropDown(
      labelText: AppLocalization.currentLocalization().selectTreatment,
      textStyle: AppFontTextStyles.textStyleSmall().copyWith(fontSize: 12),
      initialValue: bloc.state.anatomyTreatmentModel,
      showInitialValue: bloc.state.anatomyTreatmentModel != null,
      labelTextStyle: AppFontTextStyles.textStyleSmall().copyWith(fontSize: 12),
      onChanged:
          (item) =>
              bloc.add(TreatmentChangeEvent(anatomyTreatmentModel: item!)),
      items: bloc.state.anatomyTreatmentList,
      itemLabel: (item) => item.name,
    );
  }
}

class _DeleteAndSaveView extends StatelessWidget {
  final AnatomyTreatmentOptionBloc bloc;

  const _DeleteAndSaveView({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIconButton(
          hasBorder: true,
          borderColor: AppColors.lightRed,
          onTap: () => bloc.add(DeletedAnatomyEvent()),
          iconWidget: Icon(
            Icons.delete_forever_rounded,
            color: AppColors.lightRed,
            size: 20,
          ),
        ),
        Gap(10),
        Expanded(
          child: AppTextButton(
            title: AppLocalization.currentLocalization().save,
            titleTextStyle: AppFontTextStyles.buttonTextStyle().copyWith(
              fontSize: 14,
            ),
            height: 36,
            visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
            hasBorder: true,
            borderRadius: 12,
            borderWidth: 0.7,
            onTap: () => bloc.add(SaveButtonTapEvent()),
          ),
        ),
      ],
    );
  }
}
