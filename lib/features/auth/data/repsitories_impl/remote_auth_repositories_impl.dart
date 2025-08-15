import 'package:injectable/injectable.dart';
import 'package:soundx/core/extensions/mapper_extension.dart';
import 'package:soundx/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:soundx/features/auth/domain/entities/user_entity.dart';
import 'package:soundx/features/auth/domain/repositories/remote_auth_repositories.dart';

@LazySingleton(as: RemoteAuthRepositories)
class RemoteAuthRepositoriesImpl implements RemoteAuthRepositories {
  final AuthRemoteDataSource authRemoteDataSource;

  RemoteAuthRepositoriesImpl(this.authRemoteDataSource);

  @override
  Future<void> signInWithEmail() {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> signInWithGoogle() async {
    try {
      final userModel = await authRemoteDataSource.signInWithGoogle();
      return userModel?.toUserEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword() {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    await authRemoteDataSource.signOut();
  }

  @override
  Future<UserEntity?> signUp({
    required String email,
    required String displayName,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.signUp(
        email: email,
        password: password,
        displayName: displayName,
      );
      return user?.toUserEntity();
    } catch (e) {
      rethrow;
    }
  }
}
