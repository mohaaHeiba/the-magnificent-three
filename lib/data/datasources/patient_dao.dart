import 'package:floor/floor.dart';
import 'package:the_magnificent_three/domain/entities/auth_entity.dart';
import 'package:the_magnificent_three/domain/entities/patient_entity.dart';

@dao
abstract class PatientDao {
  @insert
  Future<int?> insertPatients(PatientEntity patient);

  @delete
  Future<int?> deletePatients(PatientEntity patient);

  @Query('DELETE FROM patients')
  Future<void> deleteAllPatients();

  @Query('SELECT * FROM patients')
  Future<List<PatientEntity>> getPatients(); // Changed return type from AuthEntity to PatientEntity
}
