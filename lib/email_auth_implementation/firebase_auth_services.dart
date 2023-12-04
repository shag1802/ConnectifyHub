import 'package:firebase_auth/firebase_auth.dart';
import 'toast.dart';
import 'package:demo/provider/sign_in_provider.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // final sp = context.read<SignInProvider>();
  SignInProvider sp = SignInProvider();

  Future<User?> signUpWithEmailAndPassword(
      String username, String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('NEW USER');
      final User userDetails = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      String userid = userDetails.uid;
      sp.emailUser(email, username, userid);
      sp.saveDataToFirestore();
      showToast(
          message: 'User is successfully created, please sign in to continue');
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'The email address is already in use.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // UserCredential credential = await _auth.signInWithEmailAndPassword(
      //     email: email, password: password);
      final User userDetails = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      print('EXISITING USER');
      return userDetails;
    } on FirebaseAuthException catch (e) {
      showToast(message: 'Invalid Credentials or User does not exists');
    }
    return null;
  }
}
