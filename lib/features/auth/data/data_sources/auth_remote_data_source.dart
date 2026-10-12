import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masroof/features/auth/data/models/user_model.dart';
import 'package:masroof/features/auth/domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> registerUser({
    required String email,
    required String password,
    required String name,
  });

  Future<UserEntity> loginUser({
    required String email,
    required String password,
  });

  Future<void> logoutUser();

  Future<void> resetPassword({required String email});

  Future<UserEntity> signInWithGoogle();

  UserEntity? getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<UserEntity> loginUser({
    required String email,
    required String password,
  }) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user;

    if (user == null) {
      throw Exception('Failed to sign in: user not found.');
    }

    return UserModel.fromFirebase(user);
  }

  @override
  Future<UserEntity> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user;

    if (user == null) {
      throw Exception('Failed to create account.');
    }

    await user.updateDisplayName(name);

    return UserModel.fromFirebase(user);
  }

  @override
  UserEntity? getCurrentUser() {
    final user = firebaseAuth.currentUser;

    if (user == null) return null;

    return UserModel.fromFirebase(user);
  }

  @override
  Future<void> logoutUser() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final idToken = googleAuth.idToken;

    if (idToken == null) {
      throw Exception('Google ID token is missing.');
    }

    final credential = GoogleAuthProvider.credential(idToken: idToken);

    final userCredential = await firebaseAuth.signInWithCredential(credential);

    final user = userCredential.user;

    if (user == null) {
      throw Exception('Failed to sign in with Google.');
    }

    return UserModel.fromFirebase(user);
  }
}
