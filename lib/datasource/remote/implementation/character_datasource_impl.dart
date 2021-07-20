
import 'package:ricky_n_morty/error/exceptions.dart' as excptn;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ricky_n_morty/data/datasources/character_datasource.dart';
import 'package:ricky_n_morty/domain/model/character_model.dart';
import 'package:ricky_n_morty/util/gql_query.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this._client);

  final GraphQLClient _client;

  @override
  Future<List<CharacterModel>> getCharacters(int page) async {
    try {
      final result = await _client.query(QueryOptions(
        document: gql(GqlQuery.charactersQuery),
        variables: {"page": page},
      ));
      if (result.data == null) {
        return [];
      }
      return result.data['characters']['results']
          .map((e) => CharacterModel.fromJson(e))
          .cast<CharacterModel>()
          .toList();
    } on Exception catch (exception) {
      print(exception);
      throw excptn.ServerException();
    }
  }
}