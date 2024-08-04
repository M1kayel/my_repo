import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/Auth/authRepository/auth_repo.dart';
import 'package:instagram/Auth/authService/auth_service.dart';

class AuthRepositoryWork implements AuthRepository {
  AuthRepositoryWork(this.authService);
  AuthService authService;
  @override
  Future<UserCredential> signInWithGoogle() async {
    return authService.signInWithGoogle();
  }
}