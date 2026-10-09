import 'package:masroof/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo{
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

  // Future<UserEntity> signInWithGoogle() ;

  UserEntity? getCurrentUser();
}