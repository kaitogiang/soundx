import 'package:soundx/features/auth/domain/entities/user_entity.dart';

abstract class RemoteAuthRepositories {
  Future<UserEntity?> signInWithGoogle();

  Future<void> signInWithEmail();

  Future<void> logOut();

  Future<void> forgotPassword();

  Future<UserEntity?> signUp({
    required String email,
    required String displayName,
    required String password,
  });
}
