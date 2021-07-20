import 'package:dartz/dartz.dart';
import 'package:ricky_n_morty/domain/model/character_domain.dart';
import 'package:ricky_n_morty/domain/repository/character_repository.dart';
import 'package:ricky_n_morty/error/failures.dart';
import 'package:ricky_n_morty/presentation/model/character_item.dart';

import 'usecase.dart';

// class GetCharactersUseCase extends UseCase<List<Character>, CharacterParams> {
//   GetCharactersUseCase(this.repository);
//
//   final HomeRepository repository;
//
//   @override
//   Future<Either<Failure, List<Character>>> call(CharacterParams params) {
//     return repository.getCharacters(params.page);
//   }
// }

class GetCharactersUseCase extends BaseUseCase<List<CharacterItem>, CharacterParams> {
final HomeRepository _repository;

GetCharactersUseCase(this._repository);

@override
Future<List<CharacterItem>> buildUseCaseFuture(
    {CharacterParams params}) async {
  List<Character> characterDomainList = await _repository.getCharacters(params.page);
  return characterDomainList.mapToCharacterListItem();
}
}
class CharacterParams {
  CharacterParams(this.page);

  final int page;
}