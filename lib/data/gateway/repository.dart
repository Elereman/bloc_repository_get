import 'package:bloc_repository_get/data/model/repository_dto.dart';

abstract class RepositoryGateway {
  Future<List<RepositoryDto>> getRepository();
}
