import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorProvider =
    StateNotifierProvider<ColorProvider, bool>((ref) => ColorProvider());

class ColorProvider extends StateNotifier<bool> {
  ColorProvider() : super(false);

  bool get isFavorite {
    print("model asked for dark status: ${state}");
    return state;
  }

  changeFavorite() {
    print("toggler has listeners: ${hasListeners}");
    state = !state;
    print("toggled to: ${state}");
  }

  set isFavorite(bool value ) {
    state = value;
  }
}
