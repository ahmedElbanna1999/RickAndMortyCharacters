import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/business_logic/cubit/character_cubit/charachters_cubit.dart';
import 'package:rick_morty/data/models/charachter/charachter_model.dart';
import 'package:rick_morty/presentation/widget/charachter_item.dart';

class CharachtersScreen extends StatefulWidget {
  const CharachtersScreen({super.key});

  @override
  State<CharachtersScreen> createState() => _CharachtersScreenState();
}

class _CharachtersScreenState extends State<CharachtersScreen> {
  List<Charachter> getAllCharachters = [];
  List<Charachter> searchForCharachter = [];
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  Widget buildSearchTextField() {
    return TextField(
      cursorColor: Colors.white,
      controller: _searchController,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Rick and Morty Font',
      ),
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Find a Charachter ...',
          hintStyle: TextStyle(
            color: Colors.grey,
          )),
      onChanged: (searchCharachter) {
        addSearchedForItemsToSearchedList(searchCharachter);
      },
    );
  }

// to do: بدخل  الحرف الي بسرش بيه
  void addSearchedForItemsToSearchedList(String searchCharachter) {
    searchForCharachter = getAllCharachters
        .where((Charachter) => Charachter.name
            .toLowerCase()
            .startsWith(searchCharachter.toLowerCase()))
        .toList();
    setState(() {});
  }

// to do: الايكون الي هسرش بيه ف الحالتين
  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSeach,
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ];
    }
  }

  void _startSeach() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: () => _stopSearch(),
    ));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearch() {
    _clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<CharachtersCubit>(context).fetchAllCharachter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),*/
        centerTitle: true,
        title: isSearching
            ? buildSearchTextField()
            : const Text(
                'CHARACHTERS',
                style: TextStyle(
                  fontFamily: 'Rick and Morty Font',
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocBuilder(),
    );
  }

  Widget buildBlocBuilder() {
    return BlocBuilder<CharachtersCubit, CharachtersState>(
      builder: (context, state) {
        if (state is CharachtersLoadedState) {
          getAllCharachters = state.charachters;
          return buildLoadedListWidget();
        } else {
          return loadingIndicator();
        }
      },
    );
  }

  Widget loadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCharachtersList(),
        ],
      ),
    );
  }

  Widget buildCharachtersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchController.text.isEmpty
          ? getAllCharachters.length
          : searchForCharachter.length,
      itemBuilder: (context, index) {
        return CharachterItem(
          charachter: _searchController.text.isEmpty
              ? getAllCharachters[index]
              : searchForCharachter[index],
        );
      },
    );
  }
}







//FadeInImage.assetNetwork(
  //              placeholder: 'assets/images/Animation - 1735288249790.gif',
    //            height: double.infinity,
      //          image:
        //            'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
          //      fit: BoxFit.fill,
            //  ),