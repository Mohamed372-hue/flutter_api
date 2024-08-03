import 'package:flutter/material.dart';
import 'package:flutterexample/data%20layer/models/character_model.dart';

import '../../constants/my_strings.dart';

class GridviewItem extends StatelessWidget {
  final character characters;
  const GridviewItem({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsetsDirectional.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          charactersdetailsscreen,
          arguments: characters,
        ),
        child: Hero(
          tag: characters.id.toString(),
          child: GridTile(
            footer: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              color: Colors.black.withOpacity(0.5),
              child: Text(
                characters.name.toString(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            child: characters.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: "assets/images/loading.gif",
                    image: characters.image.toString())
                : Image.asset('assets/images/image.png'),
          ),
        ),
      ),
    );
  }
}
