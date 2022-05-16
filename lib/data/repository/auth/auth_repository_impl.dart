import 'package:covid_overcoming/config/logger/logger.dart';
import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/core/service/auth.dart';
import 'package:covid_overcoming/domain/repository/auth/auth_repository.dart';
import 'package:covid_overcoming/values/constant/constants.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this.auth,
  );

  final Auth auth;

  @override
  Future<Either<Error, User>> getCurrentUser() async {
    return await _firebaseAuthMethodCall<User>(
      function: () async {
        final user = auth.currentUser;
        if (user != null) {
          return Right(user);
        }
        return const Left(AuthError(Constants.errorUserIsNull));
      },
      errorMessage: Constants.errorGetCurrentUser,
    );
  }

  @override
  Future<Either<Error, bool>> updateEmail(String email) async {
    return await _firebaseAuthMethodCall<bool>(
      function: () async {
        await auth.updateEmail(email);
        return const Right(true);
      },
      errorMessage: Constants.errorUpdateEmail,
    );
  }

  @override
  Future<Either<Error, bool>> updateDisplayName(String displayName) async {
    return await _firebaseAuthMethodCall<bool>(
      function: () async {
        await auth.updateDisplayName(displayName);
        return const Right(true);
      },
      errorMessage: Constants.errorUpdateDisplayName,
    );
  }

  @override
  Future<Either<Error, bool>> updatePhotoUrl(String photoUrl) async {
    return await _firebaseAuthMethodCall<bool>(
      function: () async {
        await auth.updatePhotoUrl(photoUrl);
        return const Right(true);
      },
      errorMessage: Constants.errorUpdatePhotoUrl,
    );
  }

  @override
  Future<Either<Error, bool>> updatePassword(String password) async {
    return await _firebaseAuthMethodCall<bool>(
      function: () async {
        await auth.updatePassword(password);
        return const Right(true);
      },
      errorMessage: Constants.errorUpdatePassword,
    );
  }

  @override
  Future<Either<Error, bool>> deleteUser() async {
    return await _firebaseAuthMethodCall<bool>(
      function: () async {
        await auth.deleteUser();
        return const Right(true);
      },
      errorMessage: Constants.errorDeleteUser,
    );
  }

  @override
  Stream<User?> onAuthStateChanges() {
    return auth.onAuthStateChanges();
  }

  @override
  Stream<User?> onIdTokenChanges() {
    return auth.onIdTokenChanges();
  }

  @override
  Stream<User?> onUserChanges() {
    return auth.onUserChanges();
  }

  @override
  Future<Either<Error, bool>> sendEmailVerification() async {
    return await _firebaseAuthMethodCall<bool>(
      function: () async {
        // TODO: passing action code settings to email verification
        await auth.sendEmailVerification();
        return const Right(true);
      },
      errorMessage: Constants.errorSendEmailVerification,
    );
  }

  @override
  Future<Either<Error, bool>> sendPasswordResetEmail(String email) async {
    return await _firebaseAuthMethodCall<bool>(
      function: () async {
        // TODO: passing action code settings to email reset password
        await auth.sendPasswordResetEmail(email);
        return const Right(true);
      },
      errorMessage: Constants.errorSendPasswordResetEmail,
    );
  }

  @override
  Future<Either<Error, User>> reAuthenticateWithCredential(
    AuthCredential authCredential,
  ) async {
    return await _firebaseAuthMethodCall<User>(
      function: () async {
        final user = await auth.reAuthenticateWithCredential(authCredential);
        if (user != null) {
          return Right(user);
        }
        return const Left(AuthError(Constants.errorUserIsNull));
      },
      errorMessage: Constants.errorReAuthenticateWithCredential,
    );
  }

  @override
  Future<Either<Error, User>> signInAnonymously() async {
    return await _firebaseAuthMethodCall<User>(
      function: () async {
        final user = await auth.signInAnonymously();
        if (user != null) {
          return Right(user);
        }
        return const Left(AuthError(Constants.errorUserIsNull));
      },
      errorMessage: Constants.errorSignInAnonymously,
    );
  }

  @override
  Future<Either<Error, User>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Error, User>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Error, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuthMethodCall<User>(
      function: () async {
        final user = await auth.signInWithEmailAndPassword(email, password);
        if (user != null) {
          return Right(user);
        }
        return const Left(AuthError(Constants.errorUserIsNull));
      },
      errorMessage: Constants.errorSignInWithEmailAndPassword,
    );
  }

  @override
  Future<Either<Error, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuthMethodCall<User>(
      function: () async {
        final user = await auth.signUpWithEmailAndPassword(email, password);
        if (user != null) {
          return Right(user);
        }
        return const Left(AuthError(Constants.errorUserIsNull));
      },
      errorMessage: Constants.errorSignUpWithEmailAndPassword,
    );
  }

  @override
  Future<Either<Error, bool>> signOut() async {
    return await _firebaseAuthMethodCall<bool>(
      function: () async {
        await auth.signOut();
        return const Right(true);
      },
      errorMessage: Constants.errorSignOut,
    );
  }

  /// Generic function with error handling for Firebase Auth methods
  Future<Either<Error, T>> _firebaseAuthMethodCall<T>({
    required Future<Either<Error, T>> Function() function,
    required String errorMessage,
  }) async {
    try {
      return await function();
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      return Left(AuthError(e.code));
    } catch (e) {
      logger.e(e.toString());
      return Left(AuthError(errorMessage));
    }
  }
}
