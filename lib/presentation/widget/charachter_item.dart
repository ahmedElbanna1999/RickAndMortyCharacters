import 'package:flutter/material.dart';
import 'package:rick_morty/data/models/charachter/charachter_model.dart';

class CharachterItem extends StatelessWidget {
  const CharachterItem({super.key, required this.charachter});

  final Charachter charachter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GridTile(
        footer: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
          width: double.infinity,
          color: Colors.black87,
          alignment: Alignment.bottomCenter,
          child: Text(
            charachter.name,
            style: const TextStyle(
              //هنعمل OverFlow
              //overflow: T,
              height: 0.8,
              fontFamily: 'Rick and Morty Font',
              fontSize: 25,
              //fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: charachter.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/Animation - 1735288249790.gif',
                  height: 100,
                  alignment: Alignment.center,
                  image: charachter.image,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/app-icon.png'),
        ),
      ),
    );
  }
}
