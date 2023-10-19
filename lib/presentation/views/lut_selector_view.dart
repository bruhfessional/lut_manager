import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lut_manager/domain/entities/lut_selector_state.dart';
import 'package:lut_manager/presentation/bloc/lut_image_switch_cubit.dart';
import 'package:lut_manager/presentation/bloc/lut_selector_cubit.dart';

List<int> _lutItems = List.generate(1024, (index) => index);

class LutSelectorView extends StatelessWidget {
  const LutSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('LUT SELECTOR'),
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: BlocBuilder<LutSelectorCubit, LutSelectorState>(
              builder: (context, values) {
                return Container(
                  color: Colors.yellow,
                  child: ListView.builder(
                    itemCount: _lutItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TextButton(onPressed: () {
                        // context.read<LutSelectorCubit>().select(id, name, path)
                      }, child: Text('$index'));
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
