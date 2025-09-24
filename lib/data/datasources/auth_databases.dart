import 'package:floor/floor.dart';
import 'dart:async';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:the_magnificent_three/data/datasources/auth_dao.dart';
import 'package:the_magnificent_three/data/datasources/patient_dao.dart';
import 'package:the_magnificent_three/domain/entities/auth_entity.dart';
import 'package:the_magnificent_three/domain/entities/patient_entity.dart';

part 'auth_databases.g.dart';

@Database(version: 1, entities: [AuthEntity, PatientEntity])
abstract class UserDatabase extends FloorDatabase {
  AuthDao get authdao;
  PatientDao get patientdoa;
}
