import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/domain/repository/auth/auth_repository.dart';
import 'package:covid_overcoming/domain/usecase/usecase.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInWithEmailAndPasswordUseCase implements UseCase<User, SignInWithEmailAndPasswordParams> {
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

class SignInWithEmailAndPasswordParams {
  const SignInWithEmailAndPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
