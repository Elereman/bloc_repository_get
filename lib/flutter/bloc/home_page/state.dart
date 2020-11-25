import 'package:bloc_repository_get/domain/entity/repository.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/bloc_status.dart';

class HomePageState {
  final BlocStatus _status;
  final List<Repository> _data;

  HomePageState(this._status, this._data);

  List<Repository> get data => _data;

  BlocStatus get status => _status;
}
