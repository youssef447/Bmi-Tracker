import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<UserCredential> loginAnonymously() async {
    return await FirebaseAuth.instance.signInAnonymously();
  }

  Future<void> logout() async {
    return await FirebaseAuth.instance.signOut();
  }
}
