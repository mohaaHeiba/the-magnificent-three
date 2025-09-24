import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:the_magnificent_three/core/constants/app_colors.dart';
import 'package:the_magnificent_three/presentation/pages/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          brightness: Brightness.light,
          primary: AppColors.primaryLight,
          onPrimary: AppColors.onPrimaryLight,
          error: AppColors.errorLight,
          onError: AppColors.onErrorLight,
          surface: AppColors.surfaceLight,
          onSurface: AppColors.onSurfaceLight,
          primaryContainer: AppColors.containerLight,
          onPrimaryContainer: AppColors.onErrorDark,
          background: AppColors.backGroundlight,
        ),
        extensions: const [AppColors.gradientsLight],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
          primary: AppColors.primaryDark,
          onPrimary: AppColors.onPrimaryLight,
          error: AppColors.errorDark,
          onError: AppColors.onErrorDark,
          surface: AppColors.surfaceDark,
          onSurface: AppColors.onSurfaceDark,
          primaryContainer: AppColors.containerDark,
          onPrimaryContainer: AppColors.onPrimaryLight,
          background: AppColors.backGroundDark,
        ),
        extensions: const [AppColors.gradientsDark],
      ),
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
