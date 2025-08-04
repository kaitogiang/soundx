import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:soundx/features/auth/data/models/user_model.dart';

@LazySingleton()
class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSource(this.firebaseAuth, this.googleSignIn);

  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate(
        scopeHint: <String>[
          'email',
          // Thêm scopes bạn cần, ví dụ truy cập contacts như bên dưới
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      //Create new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.idToken,
      );
      final data = await firebaseAuth.signInWithCredential(credential);
      final userModel = UserModel(
        uid: data.user?.uid ?? '',
        displayName: data.user?.displayName,
        email: data.user?.email,
        phoneNumber: data.user?.phoneNumber,
      );

      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}
