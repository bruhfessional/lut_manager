import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lut_manager/domain/entities/lut_image_switch_state.dart';
import 'package:lut_manager/presentation/bloc/lut_image_switch_cubit.dart';
import 'package:lut_manager/presentation/utils/app_theme.dart';
import 'package:lut_manager/presentation/views/image_selector_view.dart';
import 'package:lut_manager/presentation/views/lut_selector_view.dart';

class LeftView extends StatelessWidget {
  const LeftView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: BlocBuilder<LutImageSwitchCubit, LutImageSwitchState>(
        builder: (context, values) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('LUT'),
                    Switch(
                      value: values.status,
                      onChanged: (bool value) {
                        context.read<LutImageSwitchCubit>().setOpposite();
                      },
                    ),
                    const Text('Images'),
                  ],
                ),
              ),
              Expanded(
                child: context.read<LutImageSwitchCubit>().state.status
                    ? const ImageSelectorView()
                    : const LutSelectorView(),
              ),
            ],
          );
        },
      ),
    );
  }
}
