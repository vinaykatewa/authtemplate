import 'package:authtemplate/core/error/failures.dart';
import 'package:authtemplate/core/usecase/usecase.dart';
import 'package:authtemplate/core/common/entities/user.dart';
import 'package:authtemplate/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository repository;

  UserLogin({required this.repository});
  @override
  Future<Either<Failure, User>> callMethod(UserLoginParams params) async {
    return await repository.loginWithEmailPassword(email: params.email, password: params.password);
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}
