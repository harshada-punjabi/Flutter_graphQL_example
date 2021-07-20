


import 'package:dartz/dartz.dart';
import 'package:ricky_n_morty/data/datasources/character_datasource.dart';
import 'package:ricky_n_morty/domain/model/character_domain.dart';
import 'package:ricky_n_morty/domain/model/character_model.dart';
import 'package:ricky_n_morty/domain/repository/character_repository.dart';
import 'package:ricky_n_morty/error/exceptions.dart';
import 'package:ricky_n_morty/error/failures.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._remoteDataSource);


  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<List<Character>> getCharacters(int page) async {
      try {
        final models = await _remoteDataSource.getCharacters(page);
        final entities = models.map<Character>((e) => e.toEntity()).toList();
        return entities;
      } on ServerException {
         ServerFailure();
      }
  }
}