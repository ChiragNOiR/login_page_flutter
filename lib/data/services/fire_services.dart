import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FireService {
  Future<String> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      return 'Registered';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Password is too weak';
      } else if (e.code == 'email already registered') {
        return 'The email you are trying to register is already registered';
      }
      return 'We are unable to process at the moment';
    }
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      (await _auth.signInWithEmailAndPassword(email: email, password: password))
          .user;
      return 'Logged In Successfully';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'No user is found') {
        return 'No user is found with the email. Please register first';
      } else if (e.code == 'wrong password' || e.code == 'invalid email') {
        return 'The password or the email that is provided doesn\'t match';
      }
      return 'We are unable to process at the moment';
    }
  }
}
