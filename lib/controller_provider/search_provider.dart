import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/movie_model.dart';
import '../provider/movie_provider.dart';

final searchProvider = StateProvider((ref) => '');

final searchItemProvider = StateProvider<List<MovieModel>>((ref) {
  final search = ref.watch(searchProvider);
  List<MovieModel> movies = ref.watch(moviesProvider).movies;
  return movies
      .where((element) => element.toString().contains(search))
      .toList();
});