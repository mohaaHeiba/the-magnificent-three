import 'package:get/get.dart';
import 'package:the_magnificent_three/data/datasources/patient_dao.dart';
import 'package:the_magnificent_three/domain/entities/auth_entity.dart';
import 'package:the_magnificent_three/domain/entities/patient_entity.dart';
import 'package:the_magnificent_three/presentation/controllers/auth/auth_controll.dart';
import 'package:the_magnificent_three/presentation/controllers/settings/settings_controll.dart';

class HomeControll extends GetxController {
  final controller = Get.find<AuthController>();

  final user = Rxn<AuthEntity>();
  final RxList<PatientEntity> recentPatients = <PatientEntity>[].obs;
  final normalCount = 0.obs;
  final abnormalCount = 0.obs;
  final totalScans = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    loadUser();
    loadHistoryData();
  }

  Future<void> loadUser() async {
    user.value = await controller.getUser();
    s();
  }

  Future<void> s() async {
    Get.put(SettingsControll());
  }

  Future<void> loadHistoryData() async {
    try {
      final patientDao = Get.find<PatientDao>();
      final patients = await patientDao.getPatients();

      // Update stats
      totalScans.value = patients.length;
      normalCount.value = patients
          .where((p) => p.detected.toLowerCase() == 'notumor')
          .length;
      abnormalCount.value = patients
          .where((p) => p.detected.toLowerCase() != 'notumor')
          .length;

      // Get most recent patients (last 5)
      recentPatients.value = patients.reversed.take(5).toList();
    } catch (e) {
      print('Error loading history data: $e');
    }
  }
}
