import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/business_logic/cubit/character_cubit/charachters_cubit.dart';
import 'package:rick_morty/data/repository/charachters_repository.dart';
import 'package:rick_morty/data/web_services/charachter_web_services.dart';
import 'package:rick_morty/presentation/screens/charachters/character_details_screen.dart';
import 'package:rick_morty/constans/strings.dart';
import 'package:rick_morty/presentation/screens/charachters/charachters_screen.dart';
import 'package:rick_morty/presentation/screens/home/home_screen.dart';

class AppRouter {
  late CharachtersRepository charachtersRepository;
  late CharachtersCubit charachtersCubit;

  AppRouter() {
    charachtersRepository = CharachtersRepository(CharachterWebServices());
    charachtersCubit = CharachtersCubit(charachtersRepository);
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case charactersDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const CharactersDetailsScreen(),
        );

      case charachtersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (BuildContext context) =>
                CharachtersCubit(charachtersRepository),
            child: CharachtersScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('404: Page not found'),
            ),
          ),
        );
    }
  }
}
