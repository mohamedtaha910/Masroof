import 'package:masroof/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:masroof/features/auth/domain/entities/user_entity.dart';
import 'package:masroof/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  UserEntity? getCurrentUser() {
    return remoteDataSource.getCurrentUser();
  }

  @override
  Future<UserEntity> loginUser({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.loginUser(email: email, password: password);
  }

  @override
  Future<UserEntity> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    return await remoteDataSource.registerUser(
      email: email,
      password: password,
      name: name,
    );
  }

  @override
  Future<void> logoutUser() async {
    await remoteDataSource.logoutUser();
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await remoteDataSource.resetPassword(email: email);
  }

  // @override
  // Future<UserEntity> signInWithGoogle()async {
  //   await remoteDataSource.signInWithGoogle();
  // }
}
