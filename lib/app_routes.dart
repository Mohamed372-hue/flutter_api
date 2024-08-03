import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterexample/business_logic%20layer/cubit/cubit/characters_cubit.dart';
import 'package:flutterexample/constants/my_strings.dart';
import 'package:flutterexample/data%20layer/models/character_model.dart';
import 'package:flutterexample/data%20layer/repository/characters_repository.dart';
import 'package:flutterexample/data%20layer/web_servises/characterts_web_service.dart';

import 'presentation layer/screens/characters_details_screen.dart';
import 'presentation layer/screens/characters_screen.dart';

class AppRoutes {
  late CharactersRepository charactersrepository;
  late CharactersCubit characterscubit;
  AppRoutes() {
    ///constructor
    charactersrepository =
        CharactersRepository(charactertsWebService: CharactertsWebService());
    characterscubit =
        CharactersCubit(charactersrepository: charactersrepository);
  }
  // ignore: body_might_complete_normally_nullable
  Route? generateroutes(RouteSettings settings) {
    switch (settings.name) {
      case charactersscreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => characterscubit,
                child: const CharactersScreen()));
      case charactersdetailsscreen:
        final characters = settings.arguments as character;
        return MaterialPageRoute(
            builder: (_) => CharactersDetailsScreen(
                  characters: characters,
                ));
    }
  }
}
