import 'package:covid_overcoming/values/constant/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class Auth {
  /// Manage user
  User? get currentUser;

  Future<void> updateEmail(String email);

  Future<void> updateDisplayName(String displayName);

  Future<void> updatePhotoUrl(String photoUrl);

  Future<void> updatePassword(String password);

  Future<void> deleteUser();

  /// Auth state
  Stream<User?> onAuthStateChanges();

  Stream<User?> onIdTokenChanges();

  Stream<User?> onUserChanges();

  /// Email sending
  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetEmail(String email);

  /// Auth methods
  Future<User?> reAuthenticateWithCredential(AuthCredential authCredential);

  Future<User?> signInAnonymously();

  Future<User?> signInWithGoogle();

  Future<User?> signInWithFacebook();

  Future<User?> signInWithEmailAndPassword(String email, String password);

  Future<User?> signUpWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}

@LazySingleton(as: Auth)
class AuthImpl implements Auth {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> updateEmail(String email) async {
    currentUser?.updateEmail(email);
  }

  @override
  Future<void> updateDisplayName(String displayName) async {
    currentUser?.updateDisplayName(displayName);
  }

  @override
  Future<void> updatePhotoUrl(String photoUrl) async {
    currentUser?.updatePhotoURL(photoUrl);
  }

  @override
  Future<void> updatePassword(String password) async {
    currentUser?.updatePassword(password);
  }

  @override
  Future<void> deleteUser() async {
    currentUser?.delete();
  }

  /// Listen when user is signed in or signed out
  @override
  Stream<User?> onAuthStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  /// Listen when user is signed in or signed out or change current token
  /// Use with custom Firebase Admin SDK
  @override
  Stream<User?> onIdTokenChanges() {
    return _firebaseAuth.idTokenChanges();
  }

  /// Listen when user is signed in or signed out or change current token
  /// Or methods called by 'FirebaseAuth.instance.currentUser'
  /// Eg: reload(), unlink(), updateEmail(), ...
  @override
  Stream<User?> onUserChanges() {
    return _firebaseAuth.userChanges();
  }

  @override
  Future<void> sendEmailVerification() async {
    currentUser?.sendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<User?> reAuthenticateWithCredential(
    AuthCredential authCredential,
  ) async {
    final credential = await currentUser?.reauthenticateWithCredential(
      authCredential,
    );
    return credential?.user;
  }

  @override
  Future<User?> signInAnonymously() async {
    final credential = await _firebaseAuth.signInAnonymously();
    return credential.user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
          code: Constants.codeMissingGoogleIdToken,
          message: Constants.errorMissingGoogleIdToken,
        );
      }
    } else {
      throw FirebaseAuthException(
        code: Constants.errorSignInWithGoogle,
      );
    }
  }

  @override
  Future<User?> signInWithFacebook() async {
    final fb = FacebookLogin();
    final result = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (result.status) {
      case FacebookLoginStatus.success:
        final accessToken = result.accessToken;
        final userCredential = await _firebaseAuth.signInWithCredential(
          FacebookAuthProvider.credential(accessToken?.token ?? ''),
        );
        return userCredential.user;
      case FacebookLoginStatus.cancel:
        throw FirebaseAuthException(
          code: Constants.errorSignInWithFacebook,
        );
      case FacebookLoginStatus.error:
        throw FirebaseAuthException(
          code: Constants.errorSignInWithFacebook,
          message: result.error?.developerMessage,
        );
      default:
        throw UnimplementedError();
    }
  }

  @override
  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    await _firebaseAuth.signOut();
  }
}
