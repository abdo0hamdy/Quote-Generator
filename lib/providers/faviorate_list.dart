

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_task2/models/quotes.dart';

class FavoriteNotifier extends StateNotifier<List<Qutoe>> {
  FavoriteNotifier() : super([]);

  void addItem(Qutoe item) {
    state = [...state, item];
  }

  void removeItem(Qutoe item) {
    state = state.where((element) => element != item).toList();
  }
}

final favoriteItemsProvider =
    StateNotifierProvider<FavoriteNotifier, List<Qutoe>>((ref) {
  return FavoriteNotifier();
});
