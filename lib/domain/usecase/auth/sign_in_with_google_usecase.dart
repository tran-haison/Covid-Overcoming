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
