part of 'characters_cubit.dart';

sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class charactersloaded extends CharactersState {
  ///after loaded data it will store in characterslist
  final List<character> characters;
  charactersloaded({required this.characters});
}
