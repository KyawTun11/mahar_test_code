import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferences =
FutureProvider<SharedPreferences>((_) async => await SharedPreferences.getInstance());

class FavoriteIds extends StateNotifier<List<String>> {
  FavoriteIds(this.pref) : super(pref?.getStringList("id") ?? []);

  static final provider = StateNotifierProvider<FavoriteIds, List<String>>((ref) {
    final pref = ref.watch(sharedPreferences).maybeWhen(
      data: (value) => value,
      orElse: () => null,
    );
    return FavoriteIds(pref);
  });

  final SharedPreferences? pref;

  void toggle(String favoriteId) {
    if (state.contains(favoriteId)) {
      state = state.where((favorite) => favorite != favoriteId).toList();
    } else {
      state = [...state, favoriteId];
    }
    // Throw here since for some reason SharedPreferences could not be retrieved
    pref!.setStringList("id", state);
  }
}

// final LocalStorage storage = LocalStorage('test_app');
// final list = {};
// void addItemsLocalStorage(v) {
//   final df = storage.getItem('favorite');
//   var dData = {};
//   if (df != null) {
//     dData = json.decode(df);
//   }
//   dData.addAll(v);
//   // final g = dData;
//   // final info = json.encode(g);
//   storage.setItem('favorite', dData.toString());
// }
//
// void removeFavorite(v) {
//   // storage.deleteItem("favorite");
//   final df = storage.getItem('favorite');
//
//   //final dData = json.decode(df);
//   //print(dData);
//   //
//   // dData.delete(v);
//   //
//   // final info = json.encode(dData);
//   // storage.setItem('favorite', info);
// }
