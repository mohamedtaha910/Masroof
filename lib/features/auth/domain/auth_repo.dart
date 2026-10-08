abstract class AuthRepo{
  Future<void> registerUser({
    required String email,
    required String password,
    required String name,
  });

  Future<void> loginUser({
    required String email,
    required String password,
  });

  Future<void> logoutUser();

  Future signInWithGoogle() ;
}