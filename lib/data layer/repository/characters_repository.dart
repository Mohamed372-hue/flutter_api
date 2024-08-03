import 'package:flutterexample/data%20layer/models/character_model.dart';

import '../web_servises/characterts_web_service.dart';

class CharactersRepository {
  final CharactertsWebService charactertsWebService;
  CharactersRepository({required this.charactertsWebService});

  Future<List<character>> getallcharacters() async {
    final charactersList = await charactertsWebService.getallcharacters();
    return charactersList
        .map((characterelement) => character.fromJson(characterelement))
        .toList();
  }
}
