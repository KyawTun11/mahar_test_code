import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorProvider =
    StateNotifierProvider<ColorProvider, bool>((ref) => ColorProvider());

class ColorProvider extends StateNotifier<bool> {
  ColorProvider() : super(false);

  bool get isFavorite {
    return state;
  }

  void changeFavorite() {
    state = !state;
  }

  set isFavorite(bool value) {
    state = value;
  }
}
