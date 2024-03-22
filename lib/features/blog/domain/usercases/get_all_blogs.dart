import 'package:authtemplate/core/error/failures.dart';
import 'package:authtemplate/core/usecase/usecase.dart';
import 'package:authtemplate/features/blog/domain/entities/blog.dart';
import 'package:authtemplate/features/blog/domain/repositories/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBlogs implements UseCase<List<Blog>, NoParams> {
  final BlogRepository blogRepository;
  GetAllBlogs(this.blogRepository);

  @override
  Future<Either<Failure, List<Blog>>> callMethod(NoParams params) async {
    return await blogRepository.getAllBlogs();
  }
}
