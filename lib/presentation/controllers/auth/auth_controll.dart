import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_magnificent_three/core/controller/init_database.dart';
import 'package:the_magnificent_three/domain/entities/auth_entity.dart';
import 'package:the_magnificent_three/presentation/controllers/home/home_controll.dart';
import 'package:the_magnificent_three/presentation/controllers/settings/settings_controll.dart';

class AuthController extends GetxController {
  final contName = TextEditingController();
  final contEmail = TextEditingController();
  final contPass = TextEditingController();
  final contEntry = TextEditingController();

  final selectedRole = 'Doctor'.obs;

  final List<String> entries = [
    'Doctor',
    'Radiologist',
    'Neurologist',
    'Technician',
  ];

  final boxStorage = GetStorage();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final InitDatabase _db;
  final userData = Rx<AuthEntity?>(null);

  @override
  void onInit() {
    super.onInit();
    _db = Get.find<InitDatabase>();
    // deleteUser();
    // GetStorage().erase();
  }

  @override
  void onClose() {
    contName.dispose();
    contEmail.dispose();
    contPass.dispose();
    contEntry.dispose();
    super.onClose();
  }

  Future<AuthEntity?> getUser() async {
    final data = await _db.userdata.authdao.getAuth();
    if (data != null) {
      userData.value = data;

      return data;
    } else {
      return null;
    }
  }

  Future<int?> inserUser() async {
    try {
      final id = await _db.userdata.authdao.insertAuth(
        AuthEntity(
          1,
          name: contName.text,
          email: contEmail.text,
          pass: contPass.text,
        ),
      );

      if (id != null) {
        print('✅ Success, inserted with id: $id');
        Get.lazyPut(() => HomeControll());
      } else {
        print('⚠️ Failed to insert');
      }

      return id;
    } catch (e) {
      print('❌ Error inserting user: $e');
      return null;
    }
  }

  Future<AuthEntity?> updateUser() async {
    try {
      final data = await _db.userdata.authdao.updatetAuth(
        AuthEntity(
          1,
          name: contName.text,
          email: contEmail.text,
          pass: contPass.text,
        ),
      );

      if (data != null) {
        print('Suscess');
      } else {
        print("Faild");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> deleteUser() async {
    try {
      final auth =
          userData.value ?? AuthEntity(1, name: '', email: '', pass: '');

      await _db.userdata.authdao.deleteAuth(auth);
      userData.value = null;

      print("✅ User deleted");
    } catch (e) {
      print("❌ Error deleting user: $e");
    }
  }
}
