part of 'charachters_cubit.dart';

@immutable
abstract class CharachtersState {}

final class CharachtersInitialState extends CharachtersState {}

final class CharachtersLoadedState extends CharachtersState {
  final List<Charachter> charachters;

  CharachtersLoadedState(this.charachters);
}

final class CharachtersLoadingState extends CharachtersState {}

final class CharachtersfaillerState extends CharachtersState {}
