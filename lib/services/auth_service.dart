import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  // Sign in with email and password
  Future<firebase_auth.User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      firebase_auth.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      firebase_auth.User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future<firebase_auth.User?> registerWithEmailAndPassword(String email, String password) async {
  try {
    firebase_auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    firebase_auth.User? user = result.user;
    await _auth.signOut();
    return user;
  } catch (e) {
    print(e.toString());
    return null;
  }
  }
  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
 

  Future<String?> getAuthUserId() async {
    firebase_auth.User? user = _auth.currentUser;
    return user?.uid;
  }
}
