import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_magnificent_three/domain/entities/auth_entity.dart';
import 'package:the_magnificent_three/presentation/controllers/auth/auth_controll.dart';
import 'package:the_magnificent_three/presentation/controllers/home/home_controll.dart';

class SettingsControll extends GetxController {
  final controller = Get.find<AuthController>();
  final c = Get.find<HomeControll>();

  final user = Rxn<AuthEntity>();

  final RxBool isDarkMode = false.obs;

  Future<void> loadData() async {
    user.value = c.user.value;
  }

  Future<void> deleteData() async {
    await controller.deleteUser();
  }

  Future<void> updateData() async {
    await controller.updateUser();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;

    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);

    GetStorage().write('darkMode', isDarkMode.value);
  }

  @override
  void onInit() {
    super.onInit();
    loadData();

    @override
    void onInit() {
      super.onInit();
      loadData();

      // قراءة القيمة المحفوظة
      final saved = GetStorage().read('darkMode');
      if (saved != null) {
        isDarkMode.value = saved;
        Get.changeThemeMode(saved ? ThemeMode.dark : ThemeMode.light);
      }
    }
  }
}
