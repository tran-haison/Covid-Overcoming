import 'package:covid_overcoming/domain/repository/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class OnAuthStateChangesUseCase {
  const OnAuthStateChangesUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Stream<User?> call() {
    return _authRepository.onAuthStateChanges();
  }
}
