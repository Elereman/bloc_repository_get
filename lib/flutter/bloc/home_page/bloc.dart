import 'package:bloc_repository_get/domain/usecase/initialize_app.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/event/event.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/event/initialize_app.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/state.dart';
import 'package:rxdart/rxdart.dart';

class HomePageBloc {
  final BehaviorSubject<HomePageEvent> _eventSubject;
  final BehaviorSubject<HomePageState> _stateSubject;

  final InitializeAppUseCase _initializeAppUseCase;

  HomePageState _state;

  HomePageBloc(this._initializeAppUseCase)
      : _eventSubject = BehaviorSubject<HomePageEvent>(),
        _stateSubject = BehaviorSubject<HomePageState>(),
        super() {
    _eventSubject.listen((HomePageEvent event) {
      _state = event.reduce(_state);
      _stateSubject.add(_state);
    });
  }

  void initializeApp() {
    _eventSubject
        .add(InitializeAppEvent(_initializeAppUseCase, _eventSubject.sink));
  }
}
