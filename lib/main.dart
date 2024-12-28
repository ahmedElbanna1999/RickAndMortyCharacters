import 'package:flutter/material.dart';
import 'package:rick_morty/presentation/app_router.dart';

void main() {
  runApp(RickAndMortyApp(
    appRouter: AppRouter(),
  ));
}

class RickAndMortyApp extends StatelessWidget {
  RickAndMortyApp({
    super.key,
    required this.appRouter,
  });

  late AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      //initialRoute: homeScreen,
    );
  }
}
