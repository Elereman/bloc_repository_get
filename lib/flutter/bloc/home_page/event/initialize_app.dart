import 'package:bloc_repository_get/domain/entity/repository.dart';
import 'package:bloc_repository_get/domain/usecase/initialize_app.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/bloc_status.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/event/data_loaded.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/event/error.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/event/event.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/state.dart';

class InitializeAppEvent implements HomePageEvent {
  final InitializeAppUseCase _initializeAppUseCase;
  final Sink<HomePageEvent> _eventSink;

  InitializeAppEvent(this._initializeAppUseCase, this._eventSink);

  @override
  HomePageState reduce(HomePageState state) {
    _initializeAppUseCase()
        .then((List<Repository> repositories) => _eventSink.add(
            DataLoadedEvent(HomePageState(BlocStatus.Loaded, repositories))))
        .catchError((Object e) => _eventSink.add(ErrorEvent()));
    return HomePageState(BlocStatus.Loading, null);
  }
}
