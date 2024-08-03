import 'package:flutter/material.dart';
import 'package:flutterexample/data%20layer/models/character_model.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final character characters;
  const CharactersDetailsScreen({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildappbarsilver(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                color: Colors.grey,
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Gender : ', characters.gender.toString()),
                      buildDivider(315),
                      characterInfo('Status : ', characters.status.toString()),
                      buildDivider(250),
                      characterInfo(
                          'spieses : ', characters.species.toString()),
                      buildDivider(250),
                    ]))
          ]))
        ],
      ),
    );
  }

  Widget buildappbarsilver() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          characters.name.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        background: Hero(
          tag: characters.id.toString(),
          child: Image.network(
            characters.image.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Colors.deepOrange,
      thickness: 2,
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
