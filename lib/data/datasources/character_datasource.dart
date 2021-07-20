
import 'package:ricky_n_morty/domain/model/character_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CharacterModel>> getCharacters(int page);
}