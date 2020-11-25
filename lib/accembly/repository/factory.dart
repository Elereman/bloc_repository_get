import 'package:bloc_repository_get/accembly/factory.dart';
import 'package:bloc_repository_get/data/model/repository_dto.dart';
import 'package:bloc_repository_get/domain/entity/repository.dart';

class RepositoryFactoryFromDto implements Factory<Repository, RepositoryDto> {
  @override
  Repository create(RepositoryDto parameter) =>
      Repository(parameter.name, parameter.url);
}
