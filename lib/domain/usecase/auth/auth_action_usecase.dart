import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/domain/repository/auth/auth_repository.dart';
import 'package:covid_overcoming/domain/usecase/usecase.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInWithGoogleUseCase implements UseCaseNoParam<User> {
  const SignInWithGoogleUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Error, User>> call() {
    return _authRepository.signInWithGoogle();
  }
}

@injectable
class SignInWithFacebookUseCase implements UseCaseNoParam<User> {
  const SignInWithFacebookUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Error, User>> call() {
    return _authRepository.signInWithFacebook();
  }
}

@injectable
class SignInWithEmailAndPasswordUseCase
    implements UseCase<User, SignInWithEmailAndPasswordParams> {
  const SignInWithEmailAndPasswordUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Error, User>> call(SignInWithEmailAndPasswordParams params) {
    return _authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

@injectable
class SignUpWithEmailAndPasswordUseCase
    implements UseCase<User, SignUpWithEmailAndPasswordParams> {
  const SignUpWithEmailAndPasswordUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Error, User>> call(SignUpWithEmailAndPasswordParams params) {
    return _authRepository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

@injectable
class SignOutUseCase implements UseCaseNoParam<bool> {
  const SignOutUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Error, bool>> call() {
    return _authRepository.signOut();
  }
}

class SignUpWithEmailAndPasswordParams {
  const SignUpWithEmailAndPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class SignInWithEmailAndPasswordParams {
  const SignInWithEmailAndPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
