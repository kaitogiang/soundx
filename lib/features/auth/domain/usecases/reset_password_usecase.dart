import 'package:injectable/injectable.dart';
import 'package:soundx/features/auth/domain/repositories/remote_auth_repositories.dart';

@LazySingleton()
class ResetPasswordUseCase {
  final RemoteAuthRepositories authRepositories;

  ResetPasswordUseCase(this.authRepositories);

  Future<ResetPasswordOutput> call(ResetPasswordInput input) async {
    try {
      await authRepositories.sendPasswordResetEmail(email: input.email);
      return ResetPasswordOutput(isOk: true);
    } catch (e) {
      rethrow;
    }
  }
}

class ResetPasswordInput {
  final String email;

  const ResetPasswordInput({required this.email});
}

class ResetPasswordOutput {
  final bool isOk;

  const ResetPasswordOutput({this.isOk = false});
}
