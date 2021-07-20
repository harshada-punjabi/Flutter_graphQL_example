import 'package:dartz/dartz.dart';
import 'package:ricky_n_morty/domain/model/character_domain.dart';
import 'package:ricky_n_morty/error/failures.dart';

abstract class HomeRepository {
  Future<List<Character>> getCharacters(int page);
}
