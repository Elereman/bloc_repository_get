import 'dart:convert';

import 'package:bloc_repository_get/accembly/factory.dart';
import 'package:bloc_repository_get/data/gateway/repository.dart';
import 'package:bloc_repository_get/data/model/repository_dto.dart';
import 'package:http/http.dart' as http;

class RestRepositoryGateway implements RepositoryGateway {
  final String _baseUrl;
  final String _path;

  final Factory<RepositoryDto, Map<String, dynamic>> _dtoFactory;

  RestRepositoryGateway(this._baseUrl, this._path, this._dtoFactory);

  @override
  Future<List<RepositoryDto>> getRepository() async {
    final http.Response response =
        await http.get(Uri.https(_baseUrl, _path).toString());
    final List<dynamic> jsonResponse =
        json.decode(response.body) as List<dynamic>;
    final List<Map<String, dynamic>> jsonList = jsonResponse
        .map((dynamic element) => element as Map<String, dynamic>)
        .toList();
    return jsonList
        .map((Map<String, dynamic> json) => _dtoFactory.create(json))
        .toList();
  }
}
