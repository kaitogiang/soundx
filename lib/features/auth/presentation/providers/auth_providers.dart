import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundx/core/config/di.dart';
import 'package:soundx/features/auth/domain/entities/user_entity.dart';
import 'package:soundx/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:soundx/features/auth/domain/usecases/sign_out_usecase.dart';

final loginStatusProvider = StateProvider<bool>((_) {
  // final currentUser = getIt<FirebaseAuth>().currentUser;
  // return currentUser != null;
  return false;
});

final currentSignedInUserProvider = StateProvider<UserEntity?>((_) {
  final currentUser = getIt<FirebaseAuth>().currentUser;
  final userEntity = UserEntity(
    uid: currentUser?.uid ?? '',
    email: currentUser?.email,
    displayName: currentUser?.displayName,
    phoneNumber: currentUser?.displayName,
  );

  if (currentUser != null) {
    return userEntity;
  }
  return null;
});

final signInWithGoogleProvider = FutureProvider<UserEntity?>((ref) async {
  try {
    final signInInWithGoogleUseCase = getIt<SignInWithGoogleUseCase>();
    final output = await signInInWithGoogleUseCase(SignInWithGoogleInput());
    if (output.userEntity != null) {
      //Success
      ref.read(loginStatusProvider.notifier).state = true;
      ref.read(currentSignedInUserProvider.notifier).state = output.userEntity;
      return output.userEntity;
    }
  } catch (e) {
    print('Error: $e');
    ref.read(loginStatusProvider.notifier).state = false;
    ref.read(currentSignedInUserProvider.notifier).state = null;
    ref.invalidateSelf();
  }
});

final logoutProvider = FutureProvider.autoDispose<void>((ref) async {
  try {
    final logOutUseCase = getIt<SignOutUseCase>();
    final output = await logOutUseCase(SignOutInput());
    if (output.isSignedOut) {
      ref.read(currentSignedInUserProvider.notifier).state = null;
      return;
    }
  } catch (e) {
    print('Error: $e');
  }
});

final termsAgreementProvider = StateProvider((_) => false);
