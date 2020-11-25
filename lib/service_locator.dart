import 'package:bloc_repository_get/accembly/factory.dart';
import 'package:bloc_repository_get/accembly/repository/factory.dart';
import 'package:bloc_repository_get/accembly/repository_dto/factory.dart';
import 'package:bloc_repository_get/data/gateway/repository.dart';
import 'package:bloc_repository_get/data/model/repository_dto.dart';
import 'package:bloc_repository_get/data/rest/gateway/repository.dart';
import 'package:bloc_repository_get/data/service/get_repository_through_rest.dart';
import 'package:bloc_repository_get/domain/entity/repository.dart';
import 'package:bloc_repository_get/domain/service/get_repository_list.dart';
import 'package:bloc_repository_get/domain/usecase/initialize_app.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

const String BASEURL = 'api.github.com';
const String PATH = '/users/elereman/repos';

void init() {
  sl.registerLazySingleton<Factory<RepositoryDto, Map<String, dynamic>>>(
      () => RepositoryDtoFromJsonFactory());
  sl.registerLazySingleton<Factory<Repository, RepositoryDto>>(
      () => RepositoryFromDtoFactory());
  sl.registerLazySingleton<RepositoryGateway>(() => RestRepositoryGateway(
      BASEURL, PATH, sl.get<Factory<RepositoryDto, Map<String, dynamic>>>()));
  sl.registerLazySingleton<GetRepositoryListService>(() =>
      GetRepositoryListThroughRestService(sl.get<RepositoryGateway>(),
          sl.get<Factory<Repository, RepositoryDto>>()));
  sl.registerLazySingleton<InitializeAppUseCase>(
      () => InitializeAppUseCaseDefault(sl.get<GetRepositoryListService>()));
  sl.registerLazySingleton<HomePageBloc>(
      () => HomePageBloc(sl.get<InitializeAppUseCase>()));
}
