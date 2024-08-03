import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterexample/data%20layer/repository/characters_repository.dart';

import '../../../data layer/models/character_model.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersRepository charactersrepository;
  List<character> characters = [];
  CharactersCubit({required this.charactersrepository})
      : super(CharactersInitial());

  List<character> fetchallcharacters() {
    charactersrepository.getallcharacters().then((value) {
      emit(charactersloaded(characters: value));
      //this is refere instance to upove
      characters = value;
    });
    return characters;
  }
}
