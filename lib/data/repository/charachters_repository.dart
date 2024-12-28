import 'package:rick_morty/data/models/charachter/charachter_model.dart';
import 'package:rick_morty/data/web_services/charachter_web_services.dart';

class CharachtersRepository {
  final CharachterWebServices charachterWebServices;

  CharachtersRepository(this.charachterWebServices);

  Future<List<Charachter>> getAllCharachter() async {
    final charachters = await charachterWebServices.getAllCharachter();

    return charachters;
  }
}
