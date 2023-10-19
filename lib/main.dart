import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lut_manager/presentation/utils/app_theme.dart';
import 'package:lut_manager/presentation/views/main_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(const LutManager());
}

class LutManager extends StatelessWidget {
  const LutManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LUTManager',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: false,
        splitScreenMode: false,
        ensureScreenSize: true,
        child: MainView(),
      ),
    );
  }
}
