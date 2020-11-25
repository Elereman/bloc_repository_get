import 'package:bloc_repository_get/accembly/factory.dart';
import 'package:bloc_repository_get/data/model/repository_dto.dart';

class RepositoryDtoFactoryFromJson
    implements Factory<RepositoryDto, Map<String, dynamic>> {
  @override
  RepositoryDto create(Map<String, dynamic> parameter) => RepositoryDto(
      parameter['full_name'] as String, parameter['html_url'] as String);
}
