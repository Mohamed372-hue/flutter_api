import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterexample/constants/my_colors.dart';
import 'package:flutterexample/presentation%20layer/widgets/gridview_item.dart';

import '../../business_logic layer/cubit/cubit/characters_cubit.dart';
import '../../data layer/models/character_model.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<character> allcharacters;
  List<character> searchofcharacters = [];
  TextEditingController searchcontroller = TextEditingController();
  Widget buildappbartitle() {
    return const Text("characters");
  }

  Widget buildsearchfield() {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: TextField(
              decoration: const InputDecoration(
                  hintText: "find your character",
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none),
              controller: searchcontroller,
              onChanged: (value) {
                addsearchofitemtosearchlist(value);
              }),
        ),
        Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.search)))
      ],
    );
  }

//todo:filter search item
  void addsearchofitemtosearchlist(String element) {
    if (element.isEmpty) {
      searchofcharacters = allcharacters;
      return;
    } else {
      searchofcharacters = allcharacters
          .where((c) => c.name!.toLowerCase().startsWith(element))
          .toList();
    }
    setState(() {});
  }

  @override
  void dispose() {
    searchcontroller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactersCubit>(context).fetchallcharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
      appBar: AppBar(
        title: buildsearchfield(),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
        if (state is charactersloaded) {
          allcharacters = state.characters;
          return buildgridview(allcharacters);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Widget buildgridview(List<character> allcharacters) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: searchofcharacters.isEmpty
                    ? allcharacters.length
                    : searchofcharacters.length,
                itemBuilder: (context, index) {
                  return GridviewItem(
                    characters: searchofcharacters.isEmpty
                        ? allcharacters[index]
                        : searchofcharacters[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
