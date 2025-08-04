import 'package:injectable/injectable.dart';
import 'package:soundx/features/auth/domain/repositories/remote_auth_repositories.dart';

@LazySingleton()
class SignOutUseCase {
  final RemoteAuthRepositories authRepositories;
  SignOutUseCase(this.authRepositories);

  Future<SignOutOutput> call(SignOutInput input) async {
    try {
      await authRepositories.logOut();
      return SignOutOutput();
    } catch (e) {
      return SignOutOutput(isSignedOut: false);
    }
  }
}

class SignOutInput {
  const SignOutInput();
}

class SignOutOutput {
  final bool isSignedOut;
  const SignOutOutput({this.isSignedOut = true});
}
