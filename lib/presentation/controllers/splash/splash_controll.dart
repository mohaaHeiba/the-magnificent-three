import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_magnificent_three/core/side_navigation/page/side_navigation.dart';
import 'package:the_magnificent_three/presentation/pages/auth/auth_page.dart';

class SplashControll extends GetxController {
  final opacity = 0.0.obs;
  final boxStorage = GetStorage().read('loginBefore') ?? false;

  @override
  void onInit() {
    super.onInit();
    _loadSplash();
    // GetStorage().erase();
  }

  void _loadSplash() {
    Future.delayed(Duration(milliseconds: 100), () async {
      opacity.value = 1.0;
    });
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(
        () => boxStorage ? SideNavigation() : AuthPage(),
        transition: Transition.fadeIn,
      );
    });
  }
}
