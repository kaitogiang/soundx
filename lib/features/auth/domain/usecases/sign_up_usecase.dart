import 'package:injectable/injectable.dart';
import 'package:soundx/features/auth/domain/entities/user_entity.dart';
import 'package:soundx/features/auth/domain/repositories/remote_auth_repositories.dart';

@LazySingleton()
class SignUpUseCase {
  final RemoteAuthRepositories authRepositories;

  SignUpUseCase(this.authRepositories);

  Future<SignUpOutput> call(SignUpInput input) async {
    try {
      final user = await authRepositories.signUp(
        email: input.email,
        displayName: input.displayName,
        password: input.password,
      );
      return SignUpOutput(createdUser: user);
    } catch (e) {
      rethrow;
    }
  }
}

class SignUpInput {
  final String email;
  final String displayName;
  final String password;

  const SignUpInput({
    required this.email,
    required this.displayName,
    required this.password,
  });
}

class SignUpOutput {
  final UserEntity? createdUser;

  const SignUpOutput({this.createdUser});
}
