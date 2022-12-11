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

  void toggle(String favoriteId) {
    if (state.contains(favoriteId)) {
      state = state.where((favorite) => favorite != favoriteId).toList();
    } else {
      state = [...state, favoriteId];
    }
    pref!.setStringList("id", state);
  }
}
