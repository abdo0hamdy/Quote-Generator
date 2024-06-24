import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_task2/constans/strings.dart';
import 'package:intern_task2/constans/styles.dart';
import 'package:intern_task2/providers/faviorate_list.dart';
import 'package:intern_task2/services/quotes_api.dart';
import 'package:intern_task2/widgets/quote.dart';

class QutoScreen extends ConsumerWidget {
  const QutoScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final faviorates = ref.watch(favoriteItemsProvider);
    QutoesApi qutoesApi = QutoesApi();
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 100,
                  child: Stack(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: MyColor.myLightgrey,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
                          border: Border.all(color: Colors.purple, width: 1.5)),
                          child: TextButton(child: const Text("Click Here To View Favorite Quotes", style: TextStyle(fontSize: 20),)
                          ,onPressed: (){
                            Navigator.pushReplacementNamed(context, favorite_screen);
                          },),
                          ),
                          Positioned(bottom: 70,left: 310 ,child: CircleAvatar(child: Text(faviorates.length.toString()),))
                    ],
                  ),
                ),
                FutureBuilder(
                    future: qutoesApi.getNewsQuotes(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return MyQutoe(qutoe: snapshot.data![index]);
                            }),
                      );
                    }),
              ],
            ),
          )
    );
  }
}
