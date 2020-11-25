import 'package:bloc_repository_get/domain/entity/repository.dart';

abstract class GetRepositoryListService {
  Future<List<Repository>> call();
}
