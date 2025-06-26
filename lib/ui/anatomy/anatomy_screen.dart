import 'package:anatomy_widget/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../bloc/anatomy/anatomy_bloc.dart';
import '../../bloc/anatomy/anatomy_contract.dart';
import '../../core/app_extension.dart';
import '../../core/colors.dart';
import '../../core/dimens.dart';
import '../../core/enum.dart';
import '../../core/styles.dart';
import '../../model/anatomy_model.dart';
import '../../model/anatomy_treatment_model.dart';
import '../common/app_bar.dart';
import '../common/hero.dart';
import '../common/svg_icon.dart';
import '../treatment/anatomy_treatment_option.dart';

class AnatomyScreen extends StatefulWidget {
  final AnatomyViewEnum anatomyViewEnum;

  const AnatomyScreen({super.key, required this.anatomyViewEnum});

  @override
  State<AnatomyScreen> createState() => _AnatomyScreenState();
}

class _AnatomyScreenState extends BaseState<AnatomyBloc, AnatomyScreen> {
  @override
  void initState() {
    super.initState();
    bloc.add(InitAnatomyEvent(anatomyViewEnum: widget.anatomyViewEnum));
  }

  Future<void> _showDialog({
    required TapDownDetails tapDownDetails,
    required AnatomyExtendedModel anatomyModel,
  }) async {
    final existingIndex = bloc.state.pathList.indexWhere(
      (t) => t.id == anatomyModel.id,
    );
    var data = await showDialog(
      barrierColor: AppColors.transparent,
      context: context,
      builder: (_) {
        final offset = tapDownDetails.globalPosition;
        final screenSize = MediaQuery.of(context).size;

        final screenWidth = screenSize.width;
        final screenHeight = screenSize.height;

        final isDownHalf = offset.dy > screenHeight / 2;
        final isLeftHalf = offset.dx > screenWidth / 2;

        final left = offset.dx;
        double top = offset.dy;

        return Stack(
          children: [
            Positioned(
              left: left + (isLeftHalf ? -300 : -10) + 30,
              top:
                  top +
                  (isDownHalf ? -230 : -50) +
                  (Dimens.deviceType == DeviceType.desktop ? 25 : 0),
              child: Material(
                color: AppColors.transparent,
                child: AnatomyTreatmentOptionScreen(
                  teethModel:
                      (existingIndex != -1)
                          ? bloc.state.pathList.last
                          : anatomyModel,
                  isDownSide: isDownHalf,
                  isLeftSide: isLeftHalf,
                  anatomyConditionList: bloc.state.anatomyConditionList,
                  anatomyTreatmentList: bloc.state.anatomyTreatmentList,
                  anatomyViewEnum: bloc.state.anatomyView,
                ),
              ),
            ),
          ],
        );
      },
    );
    if (data == true) {
      bloc.add(DeletedAnatomyEvent());
    } else if (data != null) {
      bloc.add(
        UpdateAnatomyInfoEvent(anatomyPathModel: data as AnatomyExtendedModel),
      );
    } else {
      bloc.add(FalseAnatomySelectionEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        backgroundColor: AppColors.transparent,
        forceMaterialTransparency: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            HeroAnim(
              tag: widget.anatomyViewEnum.icon,
              child: AppSvgIcon(
                widget.anatomyViewEnum.icon,
                height: Dimens.iconXSmall,
              ),
            ),
            Gap(Dimens.icon2xSmall),
            Text(widget.anatomyViewEnum.title)
                .animate(delay: Duration(milliseconds: 500))
                .fade()
                .moveX(begin: -Dimens.padding4xLarge, end: 0),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocProvider<AnatomyBloc>(
          create: (_) => bloc,
          child: BlocBuilder<AnatomyBloc, AnatomyData>(
            builder:
                (_, __) => Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: AnatomyWidget(
                          onTap: (
                            String id,
                            selected,
                            TapDownDetails tapDownDetails,
                          ) {
                            if (int.parse(id) > 0) {
                              bloc.add(
                                AnatomyTapEvent(id: id, isSelected: selected),
                              );
                              _showDialog(
                                tapDownDetails: tapDownDetails,
                                anatomyModel: AnatomyExtendedModel(id: id),
                              );
                            }
                          },
                          borderColor: AppColors.borderColor,
                          size: MediaQuery.of(context).size.height * 0.80,
                          defaultPathColor: AppColors.transparent,
                          preSelectedPathList:
                              bloc.state.pathList
                                  .map(
                                    (e) => AnatomyModel(
                                      id: e.id,
                                      isSelected: e.isSelected,
                                      selectedColor: e.selectedColor,
                                      selectedBorderColor:
                                          AppColors.darkSurface,
                                    ),
                                  )
                                  .toList(),
                          svgImage: bloc.state.anatomyView.image,
                        ),
                      ),
                    ),
                    Gap(Dimens.space4xSmall),
                    _TreatmentInfo(
                      anatomyTreatmentList: bloc.state.anatomyTreatmentList,
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

class _TreatmentInfo extends StatelessWidget {
  final List<AnatomyTreatmentModel> anatomyTreatmentList;

  const _TreatmentInfo({required this.anatomyTreatmentList});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: AnimateList(
        delay: 500.ms,
        effects: [ScaleEffect(), FadeEffect()],
        children:
            anatomyTreatmentList
                .map(
                  (e) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimens.space4xSmall,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              color: e.selectionColor,
                              size: Dimens.icon2xSmall,
                            ),
                            Text(
                              e.name,
                              style: AppFontTextStyles.textStyleSmall()
                                  .copyWith(fontSize: Dimens.fontSizeEight),
                            ),
                          ],
                        ),
                      )
                      .animate(delay: Duration(milliseconds: 500))
                      .fade()
                      .moveY(begin: Dimens.padding4xLarge, end: 0),
                )
                .toList(),
      ),
    );
  }
}
