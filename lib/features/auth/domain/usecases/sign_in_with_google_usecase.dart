import 'package:injectable/injectable.dart';
import 'package:soundx/features/auth/domain/entities/user_entity.dart';
import 'package:soundx/features/auth/domain/repositories/remote_auth_repositories.dart';

@LazySingleton()
class SignInWithGoogleUseCase {
  final RemoteAuthRepositories authRepository;
  SignInWithGoogleUseCase(this.authRepository);
  Future<SignInWithGoogleOutput> call(SignInWithGoogleInput input) async {
    try {
      final userEntity = await authRepository.signInWithGoogle();
      return SignInWithGoogleOutput(userEntity: userEntity);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}

class SignInWithGoogleInput {
  const SignInWithGoogleInput();
}

class SignInWithGoogleOutput {
  final UserEntity? userEntity;
  const SignInWithGoogleOutput({this.userEntity});
}
