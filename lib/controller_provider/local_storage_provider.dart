import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferences = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

class IsFavorite extends StateNotifier<List<String>> {
  IsFavorite(this.prefs) : super(prefs?.getStringList("fav_list") ?? []);

  static final provider =
      StateNotifierProvider<IsFavorite, List<String>>((ref) {
    final pref = ref.watch(sharedPreferences).maybeWhen(
          data: (value) => value,
          orElse: () => null,
        );
    return IsFavorite(pref);
  });

  final SharedPreferences? prefs;

  void addFavorite(String id) {
    if (state.contains(id)) {
      state = state.where((favorite) => favorite != id).toList();
    } else {
      state = [...state, id];
    }
    prefs!.setStringList("fav_list", state);
  }

  bool? getFavorite(String favoriteId) {
    final List<String>? favorite = prefs!.getStringList('fav_list');
    return favorite?.contains(favoriteId);
  }
}
