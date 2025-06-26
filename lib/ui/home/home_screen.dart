import 'package:flutter/material.dart';
import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_contract.dart';
import '../../core/app_extension.dart';
import '../../core/colors.dart';
import '../../core/dimens.dart';
import '../../core/enum.dart';
import '../../core/routes.dart';
import '../../core/styles.dart';
import '../../localization/base_localization.dart';
import '../common/app_bar.dart';
import '../common/app_loader.dart';
import '../common/hero.dart';
import '../common/svg_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeBloc, HomeScreen> {
  @override
  void onViewEvent(ViewAction event) {
    switch (event.runtimeType) {
      case const (NavigateScreen):
        buildHandleActionEvent(event as NavigateScreen);
    }
  }

  void buildHandleActionEvent(NavigateScreen screen) {
    switch (screen.target) {
      case AppRoutes.anatomyView:
        final data = screen.data as AnatomyViewEnum;
        router.go('${AppRoutes.homeToAnatomyView}?view=${data.name}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleText: AppLocalization.currentLocalization().humanAnatomy,
        actions: [
          Padding(
            padding: EdgeInsets.all(Dimens.space4xSmall),
            child: FlutterSwitch(
              value: AppColors.isLightTheme,
              height: Dimens.toggleButtonHeight,
              width: Dimens.toggleButtonWidth,
              toggleSize: Dimens.iconMedium,
              activeIcon: Icon(Icons.light_mode_rounded),
              inactiveIcon: Icon(Icons.dark_mode_rounded),
              activeColor: AppColors.lightTextDisabled,
              inactiveColor: AppColors.darkTextDisabled,
              inactiveToggleColor: AppColors.darkBackground,
              onToggle: (value) => bloc.add(ChangeThemeEvent()),
            ),
          ),
          Gap(Dimens.spaceSmall),
        ],
      ),
      body: SafeArea(
        child: BlocProvider<HomeBloc>(
          create: (_) => bloc,
          child: BlocBuilder<HomeBloc, HomeData>(
            builder: (_, __) => _MainContent(bloc: bloc),
          ),
        ),
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({required this.bloc});

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    switch (bloc.state.state) {
      case ScreenState.content:
        return _HomeContent(bloc: bloc);
      default:
        return const AppLoader();
    }
  }
}

class _HomeContent extends StatelessWidget {
  final HomeBloc bloc;

  const _HomeContent({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: AnatomyViewEnum.values.length,
      padding: EdgeInsets.all(Dimens.spaceSmall),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: Dimens.space2xLarge,
        crossAxisSpacing: Dimens.space2xLarge,
      ),
      itemBuilder:
          (context, index) => _GridItemView(
            anatomyViewEnum: AnatomyViewEnum.values[index],
            bloc: bloc,
          ),
    );
  }
}

class _GridItemView extends StatelessWidget {
  final AnatomyViewEnum anatomyViewEnum;
  final HomeBloc bloc;

  const _GridItemView({required this.anatomyViewEnum, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.radius4xLarge),
        side: BorderSide(color: AppColors.borderColor),
      ),
      elevation: Dimens.elevationLarge,
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimens.radius4xLarge),
        onTap: () => bloc.add(CardTapEvent(anatomyViewEnum: anatomyViewEnum)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            HeroAnim(
              tag: anatomyViewEnum.icon,
              child: AppSvgIcon(
                anatomyViewEnum.icon,
                height: Dimens.icon3xLarge,
                color: AppColors.boldTextColor,
              ),
            ),
            Gap(Dimens.spaceSmall),
            Text(
              anatomyViewEnum.title,
              style: AppFontTextStyles.textStyleBold().copyWith(
                fontSize: Dimens.fontSizeEighteen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
