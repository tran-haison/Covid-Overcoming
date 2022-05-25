class Constants {
  /// Shared preferences keys
  static const keyFirstTimeInit = 'key_first_time_init';

  /// Auth error messages
  static const errorUserIsNull = 'Error user is null';
  static const errorGetCurrentUser = 'Error get current user';
  static const errorUpdateEmail = 'Error update email';
  static const errorUpdateDisplayName = 'Error update display name';
  static const errorUpdatePhotoUrl = 'Error update photo url';
  static const errorUpdatePassword = 'Error update password';
  static const errorDeleteUser = 'Error delete user';
  static const errorSendEmailVerification = 'Error send email verification';
  static const errorSendPasswordResetEmail = 'Error send password reset email';
  static const errorReAuthenticateWithCredential =
      'Error re-authenticate with credential';
  static const errorSignInAnonymously = 'Error sign in anonymously';
  static const errorSignInWithGoogle = 'Error sign in with Google';
  static const errorSignInWithFacebook = 'Error sign in with Facebook';
  static const errorSignInWithEmailAndPassword =
      'Error sign in with email and password';
  static const errorSignUpWithEmailAndPassword =
      'Error sign up with email and password';
  static const errorSignOut = 'Error sign out';
  static const errorMissingGoogleIdToken = 'Missing Google ID Token';

  /// FirebaseAuthException error codes
  static const codeFirebaseInvalidEmail = 'invalid-email';
  static const codeFirebaseEmailAlreadyInUse = 'email-already-in-use';
  static const codeFirebaseRequiresRecentLogin = 'requires-recent-login';
  static const codeFirebaseWeakPassword = 'weak-password';
  static const codeFirebaseUserMismatch = 'user-mismatch';
  static const codeFirebaseUserNotFound = 'user-not-found';
  static const codeFirebaseUserDisabled = 'user-disabled';
  static const codeFirebaseInvalidCredential = 'invalid-credential';
  static const codeFirebaseWrongPassword = 'wrong-password';
  static const codeFirebaseInvalidVerificationCode =
      'invalid-verification-code';
  static const codeFirebaseInvalidVerificationId = 'invalid-verification-id';
  static const codeFirebaseAuthInvalidEmail = 'auth/invalid-email';
  static const codeFirebaseAuthMissingAndroidPkgName =
      'auth/missing-android-pkg-name';
  static const codeFirebaseAuthMissingContinueUri = 'auth/missing-continue-uri';
  static const codeFirebaseAuthMissingIosBundleId =
      'auth/missing-ios-bundle-id';
  static const codeFirebaseAuthInvalidContinueUri = 'auth/invalid-continue-uri';
  static const codeFirebaseAuthUnauthorizedContinueUri =
      'auth/unauthorized-continue-uri';
  static const codeFirebaseAuthUserNotFound = 'auth/user-not-found';
  static const codeMissingGoogleIdToken = 'ERROR_MISSING_GOOGLE_ID_TOKEN';
}
