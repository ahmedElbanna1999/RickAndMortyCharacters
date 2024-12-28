import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_morty/data/models/charachter/charachter_model.dart';
import 'package:rick_morty/data/repository/charachters_repository.dart';

part 'charachters_state.dart';

class CharachtersCubit extends Cubit<CharachtersState> {
  final CharachtersRepository charachtersRepository;
  List<Charachter> charachters = [];

  CharachtersCubit(this.charachtersRepository)
      : super(CharachtersInitialState());

  List<Charachter> fetchAllCharachter() {
    charachtersRepository.getAllCharachter().then((charachters) => {
          emit(CharachtersLoadedState(charachters)),
          this.charachters = charachters,
        });
    return charachters;
  }
}
