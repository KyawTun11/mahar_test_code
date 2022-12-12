import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferences = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

class FavoriteIds extends StateNotifier<List<String>> {
  FavoriteIds(this.pref) : super(pref?.getStringList("id") ?? []);

  static final provider =
      StateNotifierProvider<FavoriteIds, List<String>>((ref) {
    final pref = ref.watch(sharedPreferences).maybeWhen(
          data: (value) => value,
          orElse: () => null,
        );
    return FavoriteIds(pref);
  });

  final SharedPreferences? pref;

  void addFavorite(String favoriteId) {//2
    if (state.contains(favoriteId)) {// 1,2,3
      state = state.where((favorite) => favorite != favoriteId).toList(); //1,3
    } else {
      state = [...state, favoriteId];
    }
    pref!.setStringList("id", state);
  }

  List<String>? getFavorite(String favoriteId) {
    final List<String>? items = pref!.getStringList('id');
    return items;
  }
}
