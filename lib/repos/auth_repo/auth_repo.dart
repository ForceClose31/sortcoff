import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final _auth = FirebaseAuth.instance;
  final String esp32Url =
      'http://<ESP32_IP_ADDRESS>/token';
  Future<User?> createUserWithUsernamePassword(
      String email, String password) async {
    try {
      final creds = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (creds.user != null) {
        await _sendTokenToESP32();
      }
      return creds.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
      return null;
    }
  }

  Future<User?> signInWithUsernamePassword(
      String email, String password) async {
    try {
      final creds = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (creds.user != null) {
        await _sendTokenToESP32();
      }
      return creds.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Error signing in. Please try again later.';
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email. Please register.';
          break;
        case 'wrong-password':
          errorMessage = 'Invalid password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address. Please check your email.';
          break;
        case 'user-disabled':
          errorMessage =
              'Your account has been disabled. Please contact support.';
          break;
        default:
          errorMessage =
              'An error occurred while signing in. Please try again later.';
          break;
      }
      print('Error signing in: ${e.code}');
      return Future.error(errorMessage);
    } catch (e) {
      print('Error signing in: $e');
      return Future.error(
          'An unexpected error occurred. Please try again later.');
    }
  }

  Future<User?> signinWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;
      final googleAuth = await googleUser.authentication;
      final creds = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(creds);
      if (userCredential.user != null) {
        await _sendTokenToESP32();
      }
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> _sendTokenToESP32() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String? idToken = await user.getIdToken();
      try {
        var response = await http.post(
          Uri.parse(esp32Url),
          headers: {"Content-Type": "text/plain"},
          body: idToken,
        );
        if (response.statusCode == 200) {
          print("Token sent successfully");
        } else {
          print("Failed to send token: ${response.statusCode}");
        }
      } catch (e) {
        print("Error sending token: $e");
      }
    }
  }
}
