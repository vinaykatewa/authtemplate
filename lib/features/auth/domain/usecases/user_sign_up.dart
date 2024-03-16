import 'package:authtemplate/core/error/failures.dart';
import 'package:authtemplate/core/usecase/usecase.dart';
import 'package:authtemplate/core/common/entities/user.dart';
import 'package:authtemplate/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UseCase<User, UserSignParams> {
  final AuthRepository authRepository;

  UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, User>> callMethod(UserSignParams params) async {
    return await authRepository.signUpWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignParams {
  final String name;
  final String email;
  final String password;

  UserSignParams(
      {required this.name, required this.email, required this.password});
}
