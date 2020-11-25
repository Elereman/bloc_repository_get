import 'package:bloc_repository_get/flutter/bloc/home_page/event/event.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/state.dart';

class DataLoadedEvent implements HomePageEvent {
  final HomePageState _state;

  DataLoadedEvent(this._state);

  @override
  HomePageState reduce(HomePageState state) => _state;
}
