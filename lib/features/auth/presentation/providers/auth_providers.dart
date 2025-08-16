import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_notification/overlay_notification.dart';
import 'package:soundx/core/config/di.dart';
import 'package:soundx/core/extensions/context_extension.dart';
import 'package:soundx/core/navgiation/navigation_config.dart';
import 'package:soundx/features/auth/domain/entities/user_entity.dart';
import 'package:soundx/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:soundx/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:soundx/features/auth/domain/usecases/sign_up_usecase.dart';

typedef IncomingCreatedUser =
    ({String email, String displayName, String password, BuildContext context});

final currentSignedInUserProvider = StateProvider<UserEntity?>((ref) {
  final currentUser = getIt<FirebaseAuth>().currentUser;
  final userEntity = UserEntity(
    uid: currentUser?.uid ?? '',
    email: currentUser?.email,
    displayName: currentUser?.displayName,
    phoneNumber: currentUser?.displayName,
  );

  if (currentUser != null) {
    goRouterConfig.go('\\');
    return userEntity;
  }
  goRouterConfig.go('\\login');
  return null;
});

final signInWithGoogleProvider = FutureProvider<UserEntity?>((ref) async {
  try {
    final signInInWithGoogleUseCase = getIt<SignInWithGoogleUseCase>();
    final output = await signInInWithGoogleUseCase(SignInWithGoogleInput());
    if (output.userEntity != null) {
      //Success
      ref.read(currentSignedInUserProvider.notifier).state = output.userEntity;
      return output.userEntity;
    }
  } catch (e) {
    print('Error: $e');
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

final signUpProvider = FutureProvider.autoDispose
    .family<void, IncomingCreatedUser>((ref, incoming) async {
      print("Kichalskfasd");
      try {
        final signUpUseCase = getIt<SignUpUseCase>();
        final output = await signUpUseCase(
          SignUpInput(
            email: incoming.email,
            displayName: incoming.displayName,
            password: incoming.password,
          ),
        );
        if (output.createdUser != null) {
          print('Created the user successfully');
          ref.read(currentSignedInUserProvider.notifier).state =
              output.createdUser;
          return;
        }
        toast(incoming.context.tr.somethingWrong);
      } catch (e) {
        if (e is FirebaseAuthException) {
          toast(e.message.toString());
        }
        print(e);
      }
    });
