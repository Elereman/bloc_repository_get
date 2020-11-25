import 'package:bloc_repository_get/accembly/repository_dto/factory.dart';
import 'package:bloc_repository_get/data/model/repository_dto.dart';
import 'package:bloc_repository_get/data/rest/gateway/repository.dart';
import 'package:flutter/material.dart';

import 'flutter/page/home.dart';

void main() {
  RestRepositoryGateway _gateway = RestRepositoryGateway('api.github.com',
      '/users/elereman/repos', RepositoryDtoFactoryFromJson());
  _gateway.getRepository().then((List<RepositoryDto> dtos) =>
      dtos.forEach((RepositoryDto dto) => print(dto.url)));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
