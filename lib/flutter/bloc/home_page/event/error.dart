import 'package:bloc_repository_get/flutter/bloc/home_page/bloc_status.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/event/event.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/state.dart';

class ErrorEvent implements HomePageEvent {
  @override
  HomePageState reduce(HomePageState state) =>
      HomePageState(BlocStatus.Error, null);
}
