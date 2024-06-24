import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_task2/constans/strings.dart';
import 'package:intern_task2/constans/styles.dart';
import 'package:intern_task2/models/quotes.dart';
import 'package:intern_task2/providers/faviorate_list.dart';
import 'package:intern_task2/widgets/favorite_quote.dart';

class MyFavorites extends ConsumerStatefulWidget {
  const MyFavorites({super.key});
  @override
  ConsumerState<MyFavorites> createState() => _MyFavorites();
}

class _MyFavorites extends ConsumerState<MyFavorites> {
  late List<dynamic> SearchedCharacters;
  late List<Qutoe> allQutoes;
  bool _isSearching = false;
  TextEditingController controller = TextEditingController();
  void _clearSearch() {
    setState(() {
      controller.clear();
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void addSearchedItem(String SearchedCharacter) {
    SearchedCharacters = allQutoes
        .where((chr) => chr.content.toLowerCase().startsWith(SearchedCharacter))
        .toList();
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final faviorates = ref.watch(favoriteItemsProvider);
    allQutoes = faviorates; 
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 60,
              decoration: BoxDecoration(
                  color: MyColor.myLightgrey,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.purple, width: 1.5)),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_outlined),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Qutoe_screen);
                    },
                  ),
                  TextButton(
                    child: const Text(
                      "Back To Home Screen",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Qutoe_screen);
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyColor.myLightgrey, width: 1.5)),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "   Type Something Here To Search..",
                    hintStyle:
                        TextStyle(color: MyColor.myLightgrey, fontSize: 18)),
                onChanged: (SearchedCharacter) {
                  addSearchedItem(SearchedCharacter);
                },
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: controller.text.isEmpty
                        ? faviorates.length
                        : SearchedCharacters.length,
                    itemBuilder: (context, index) {
                      return MyFavoriteQutoe(
                        qutoe: controller.text.isEmpty
                            ? faviorates[index]
                            : SearchedCharacters[index],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
