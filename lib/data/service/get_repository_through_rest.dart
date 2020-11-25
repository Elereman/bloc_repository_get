import 'package:bloc_repository_get/accembly/factory.dart';
import 'package:bloc_repository_get/data/gateway/repository.dart';
import 'package:bloc_repository_get/data/model/repository_dto.dart';
import 'package:bloc_repository_get/domain/entity/repository.dart';
import 'package:bloc_repository_get/domain/service/get_repository_list.dart';

class GetRepositoryListThroughRestService implements GetRepositoryListService {
  final RepositoryGateway _gateway;
  final Factory<Repository, RepositoryDto> _factory;

  GetRepositoryListThroughRestService(this._gateway, this._factory);

  @override
  Future<List<Repository>> call() async {
    final List<RepositoryDto> dtoList = await _gateway.getRepository();
    return dtoList.map((RepositoryDto dto) => _factory.create(dto)).toList();
  }
}
