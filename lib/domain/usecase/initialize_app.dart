import 'package:bloc_repository_get/domain/entity/repository.dart';
import 'package:bloc_repository_get/domain/service/get_repository_list.dart';

abstract class InitializeAppUseCase {
  Future<List<Repository>> call();
}

class InitializeAppUseCaseDefault implements InitializeAppUseCase {
  final GetRepositoryListService _service;

  InitializeAppUseCaseDefault(this._service);

  @override
  Future<List<Repository>> call() => _service();
}
