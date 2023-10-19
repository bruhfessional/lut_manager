import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lut_manager/presentation/bloc/image_selector_cubit.dart';
import 'package:lut_manager/presentation/bloc/lut_image_switch_cubit.dart';
import 'package:lut_manager/presentation/bloc/lut_selector_cubit.dart';
import 'package:lut_manager/presentation/utils/app_theme.dart';
import 'package:lut_manager/presentation/views/empty_view.dart';
import 'package:lut_manager/presentation/views/top_view.dart';
import 'package:lut_manager/presentation/views/bottom_view.dart';
import 'package:lut_manager/presentation/views/left_view.dart';
import 'package:multi_split_view/multi_split_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if ((_isWindowTooTight(constraints))) {
          return const EmptyView();
        } else {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => LutImageSwitchCubit()),
              BlocProvider(create: (_) => LutSelectorCubit()),
              BlocProvider(create: (_) => ImageSelectorCubit()),
            ],
            child: Scaffold(
              backgroundColor: AppTheme.context.colorScheme.onBackground,
              appBar: AppBar(
                title: const Text('Lut Manager'),
              ),
              drawer: _isWidthTooSmall(constraints)
                  ? _customPadding(
                      Drawer(width: constraints.maxHeight.sp / 2 - 40, child: const LeftView()))
                  : null,
              endDrawer: _isHeightTooSmall(constraints)
                  ? _customPadding(
                      Drawer(width: constraints.maxHeight.sp / 2 - 40, child: const BottomView()))
                  : null,
              body: _customPadding(
                MultiSplitViewTheme(
                  data: _themeData(),
                  child: MultiSplitView(
                    axis: Axis.horizontal,
                    controller: MultiSplitViewController(
                      areas: [Area(minimalWeight: 0.25), Area(minimalWeight: 0.25)],
                    ),
                    children: _isWidthTooSmall(constraints)
                        ? [_verticalViews(constraints)]
                        : [const LeftView(), _verticalViews(constraints)],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  MultiSplitViewTheme _verticalViews(BoxConstraints constraints) {
    return MultiSplitViewTheme(
      data: _themeData(),
      child: MultiSplitView(
        axis: Axis.vertical,
        controller: MultiSplitViewController(
          areas: [Area(minimalWeight: 0.25), Area(minimalWeight: 0.25)],
        ),
        children: _isHeightTooSmall(constraints)
            ? [const TopView()]
            : [const TopView(), const BottomView()],
      ),
    );
  }

  bool _isWidthTooSmall(BoxConstraints constraints) {
    return constraints.maxWidth.sp < 800.sp;
  }

  bool _isHeightTooSmall(BoxConstraints constraints) {
    return constraints.maxHeight.sp < 600.sp;
  }

  bool _isWindowTooTight(BoxConstraints constraints) {
    return (constraints.maxWidth.sp < 240.sp) || (constraints.maxHeight.sp < 240.sp);
  }

  MultiSplitViewThemeData _themeData() {
    return MultiSplitViewThemeData(
      dividerPainter: DividerPainters.grooved2(),
      dividerThickness: 15,
    );
  }

  Padding _customPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: child,
    );
  }
}
