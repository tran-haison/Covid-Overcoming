class DataConstants {
  /// Auth error
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

  /// Firebase Firestore error
  static const errorSaveAccount = 'Error save account';
  static const errorGetAccount = 'Error get account';
  static const errorCheckAccountExists = 'Error check account exists';

  /// Local cache error
  static const errorSaveLocalAccount = 'Error save local account';
  static const errorGetLocalAccount = 'Error get local account';
  static const errorClearCacheData = 'Error clear cache data';

  /// Local database error
  static const errorGetAllStages = 'Error get all stages';
}
