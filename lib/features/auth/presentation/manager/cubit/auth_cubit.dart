// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroof/features/auth/domain/entities/user_entity.dart';
import 'package:masroof/features/auth/domain/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());

    try {
      UserEntity user = await authRepo.registerUser(
        email: email,
        password: password,
        name: name,
      );
      if (user != null) {
        emit(AuthSuccess());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(AuthError('The account already exists for that email.'));
      } else if (e.code == 'weak-password') {
        emit(AuthError('The password provided is too weak.'));
      } else {
        emit(AuthError('something went wrong'));
      }
    } catch (e) {
      emit(AuthError('There was an error'));
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await authRepo.loginUser(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthError('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthError('Wrong password provided for that user.'));
      } else {
        emit(AuthError('The email or password is incorrect'));
      }
    } catch (e) {
      emit(AuthError('something went wrong'));
    }
  }

  // Future signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
  //         .authenticate();
  //     if (googleUser == null) {
  //       return;
  //     }
  //     emit(AuthLoadingState());

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth = googleUser.authentication;

  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       idToken: googleAuth.idToken,
  //     );

  //     // Once signed in, return the UserCredential
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     emit(AuthSuccessState());
  //   } on GoogleSignInException catch (e) {
  //     if (e.code == GoogleSignInExceptionCode.canceled) {
  //       // المستخدم ألغى تسجيل الدخول
  //       emit((AuthInitial()));
  //       return;
  //     }

  //     emit(AuthErrorState(e.toString()));
  //   } catch (e) {
  //     emit(AuthErrorState(e.toString()));
  //   }
  // }
}
