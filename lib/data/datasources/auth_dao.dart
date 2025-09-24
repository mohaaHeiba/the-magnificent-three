import 'package:floor/floor.dart';
import 'package:the_magnificent_three/domain/entities/auth_entity.dart';

@dao
abstract class AuthDao {
  @insert
  Future<int?> insertAuth(AuthEntity authentity);

  @delete
  Future<int?> deleteAuth(AuthEntity authentity);

  @update
  Future<int?> updatetAuth(AuthEntity authentity);

  @Query('SELECT * FROM auth LIMIT 1')
  Future<AuthEntity?> getAuth();
}
