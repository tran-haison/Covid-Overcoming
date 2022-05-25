import 'package:covid_overcoming/core/error/error.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  /// Manage user
  Future<Either<Error, User>> getCurrentUser();
  Future<Either<Error, bool>> updateEmail(String email);
  Future<Either<Error, bool>> updateDisplayName(String displayName);
  Future<Either<Error, bool>> updatePhotoUrl(String photoUrl);
  Future<Either<Error, bool>> updatePassword(String password);
  Future<Either<Error, bool>> deleteUser();

  /// Auth state
  Stream<User?> onAuthStateChanges();
  Stream<User?> onIdTokenChanges();
  Stream<User?> onUserChanges();

  /// Email sending
  Future<Either<Error, bool>> sendEmailVerification();
  Future<Either<Error, bool>> sendPasswordResetEmail(String email);

  /// Auth methods
  Future<Either<Error, User>> reAuthenticateWithCredential(
      AuthCredential authCredential);
  Future<Either<Error, User>> signInAnonymously();
  Future<Either<Error, User>> signInWithGoogle();
  Future<Either<Error, User>> signInWithFacebook();
  Future<Either<Error, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Error, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Error, bool>> signOut();
}
