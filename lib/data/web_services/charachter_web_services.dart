import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_morty/constans/strings.dart';
import 'package:rick_morty/data/models/charachter/charachter_model.dart';

class CharachterWebServices {
  Future<List<Charachter>> getAllCharachter() async {
    // Send the HTTP request
    http.Response response = await http.get(Uri.parse('$baseUrl/character'));

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Decode the JSON response
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Extract the 'results' array
      List<dynamic> charactersJson = jsonResponse['results'];

      // Map the JSON array to a list of Charachter objects
      List<Charachter> characters =
          charactersJson.map((char) => Charachter.fromJson(char)).toList();

      return characters;
    } else {
      // Handle errors (e.g., by throwing an exception)
      throw Exception('Failed to load characters');
    }
  }
}



/*
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_morty/constans/strings.dart';
import 'package:rick_morty/data/models/charachter/charachter_model.dart';

class CharachterWebServices {
  Future<List<Charachter>> getAllCharachter() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/character'));
    Map<String,dynamic> data = jsonDecode(response.body);

    return ch;
  }
}*/


//List<Charachter> charachtersList = [];
   // for (int i = 0; i < data.length; i++) {
     // charachtersList.add(
    //    Charachter.fromJson(data[i]),
  //    );
  //  }
  //  return charachtersList;