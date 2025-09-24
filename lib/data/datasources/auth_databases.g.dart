// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_databases.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $UserDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $UserDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $UserDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<UserDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorUserDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $UserDatabaseBuilderContract databaseBuilder(String name) =>
      _$UserDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $UserDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$UserDatabaseBuilder(null);
}

class _$UserDatabaseBuilder implements $UserDatabaseBuilderContract {
  _$UserDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $UserDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $UserDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<UserDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$UserDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$UserDatabase extends UserDatabase {
  _$UserDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AuthDao? _authdaoInstance;

  PatientDao? _patientdoaInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `auth` (`id` INTEGER, `name` TEXT NOT NULL, `email` TEXT NOT NULL, `pass` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `patients` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `detected` TEXT NOT NULL, `pathimage` TEXT NOT NULL, `confidence` REAL NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AuthDao get authdao {
    return _authdaoInstance ??= _$AuthDao(database, changeListener);
  }

  @override
  PatientDao get patientdoa {
    return _patientdoaInstance ??= _$PatientDao(database, changeListener);
  }
}

class _$AuthDao extends AuthDao {
  _$AuthDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _authEntityInsertionAdapter = InsertionAdapter(
            database,
            'auth',
            (AuthEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'pass': item.pass
                }),
        _authEntityUpdateAdapter = UpdateAdapter(
            database,
            'auth',
            ['id'],
            (AuthEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'pass': item.pass
                }),
        _authEntityDeletionAdapter = DeletionAdapter(
            database,
            'auth',
            ['id'],
            (AuthEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'pass': item.pass
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AuthEntity> _authEntityInsertionAdapter;

  final UpdateAdapter<AuthEntity> _authEntityUpdateAdapter;

  final DeletionAdapter<AuthEntity> _authEntityDeletionAdapter;

  @override
  Future<AuthEntity?> getAuth() async {
    return _queryAdapter.query('SELECT * FROM auth LIMIT 1',
        mapper: (Map<String, Object?> row) => AuthEntity(row['id'] as int?,
            name: row['name'] as String,
            email: row['email'] as String,
            pass: row['pass'] as String));
  }

  @override
  Future<int> insertAuth(AuthEntity authentity) {
    return _authEntityInsertionAdapter.insertAndReturnId(
        authentity, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatetAuth(AuthEntity authentity) {
    return _authEntityUpdateAdapter.updateAndReturnChangedRows(
        authentity, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteAuth(AuthEntity authentity) {
    return _authEntityDeletionAdapter.deleteAndReturnChangedRows(authentity);
  }
}

class _$PatientDao extends PatientDao {
  _$PatientDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _patientEntityInsertionAdapter = InsertionAdapter(
            database,
            'patients',
            (PatientEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'detected': item.detected,
                  'pathimage': item.pathimage,
                  'confidence': item.confidence
                }),
        _patientEntityDeletionAdapter = DeletionAdapter(
            database,
            'patients',
            ['id'],
            (PatientEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'detected': item.detected,
                  'pathimage': item.pathimage,
                  'confidence': item.confidence
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PatientEntity> _patientEntityInsertionAdapter;

  final DeletionAdapter<PatientEntity> _patientEntityDeletionAdapter;

  @override
  Future<void> deleteAllPatients() async {
    await _queryAdapter.queryNoReturn('DELETE FROM patients');
  }

  @override
  Future<List<PatientEntity>> getPatients() async {
    return _queryAdapter.queryList('SELECT * FROM patients',
        mapper: (Map<String, Object?> row) => PatientEntity(row['id'] as int?,
            name: row['name'] as String,
            detected: row['detected'] as String,
            pathimage: row['pathimage'] as String,
            confidence: row['confidence'] as double));
  }

  @override
  Future<int> insertPatients(PatientEntity patient) {
    return _patientEntityInsertionAdapter.insertAndReturnId(
        patient, OnConflictStrategy.abort);
  }

  @override
  Future<int> deletePatients(PatientEntity patient) {
    return _patientEntityDeletionAdapter.deleteAndReturnChangedRows(patient);
  }
}
