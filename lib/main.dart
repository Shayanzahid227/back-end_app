import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/screens/on_boarding/splash_screen.dart';

void main() {
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.sizeOf(context).width,
        MediaQuery.sizeOf(context).height,
      ),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                color: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
              scaffoldBackgroundColor: backGroundColor,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: SplashScreen());
      },
    );
  }
}
