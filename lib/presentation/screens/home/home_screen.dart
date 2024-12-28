import 'package:flutter/material.dart';
import 'package:rick_morty/presentation/screens/charachters/charachters_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'RMDB',
          style: TextStyle(
            fontFamily: 'Rick and Morty Font',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CharachtersScreen();
                      },
                    ),
                  );
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/characters.png',
                  ),
                ),
              ),
            ),
            const Text(
              'CHARACHTERS',
              style: TextStyle(
                fontFamily: 'Rick and Morty Font',
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/locations.png',
                  ),
                ),
              ),
            ),
            const Text(
              'LOCATION',
              style: TextStyle(
                fontFamily: 'Rick and Morty Font',
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/episodes.png',
                  ),
                ),
              ),
            ),
            const Text(
              'EPISODES',
              style: TextStyle(
                fontFamily: 'Rick and Morty Font',
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
