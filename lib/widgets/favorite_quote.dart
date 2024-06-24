import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_task2/constans/styles.dart';
import 'package:intern_task2/models/quotes.dart';
import 'package:intern_task2/providers/faviorate_list.dart';

class MyFavoriteQutoe extends ConsumerStatefulWidget {
  final Qutoe qutoe;
  const MyFavoriteQutoe({super.key, required this.qutoe});

  @override
  ConsumerState<MyFavoriteQutoe> createState() => _MyQutoeState();
}

class _MyQutoeState extends ConsumerState<MyFavoriteQutoe> {
  late Icon icon;
  bool checkItem(Qutoe qutoe, List<Qutoe> faviorates) {
    for (int x = 0; x < faviorates.length; x++) {
      if (faviorates[x].id == qutoe.id) {
        icon = const Icon(Icons.favorite);
        return true;
      }
    }
    icon = const Icon(Icons.favorite_border);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: MyDecoration.ContainerDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.qutoe.content,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  widget.qutoe.author,
                  style: const TextStyle(fontSize: 20, color: Colors.purple),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.purple, width: 1.5)),
              child: Row(
                children: [
                  IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {
                            setState(() {
                              
                              ref
                                  .read(favoriteItemsProvider.notifier)
                                  .removeItem(widget.qutoe);
                            });
                          },
                        ),
                        TextButton(onPressed: (){
                            setState(() {
                              ref
                                  .read(favoriteItemsProvider.notifier)
                                  .removeItem(widget.qutoe);
                            });
                        }, child: const Text("Remove From Favorite"))
                ],
              )
            ),
          ],
        ));
  }
}
