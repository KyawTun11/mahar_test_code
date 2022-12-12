import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/services.dart' as rootBundle;
import '../model/movie_model.dart';
import '../service/movie_service.dart';

part 'movie_provider.freezed.dart';

@freezed
abstract class MovieState with _$MovieState {
  const factory MovieState({
    @Default([]) List<MovieModel> movies,
    @Default(true) bool isLoading,
  }) = _MovieState;

  const MovieState._();
}

final moviesProvider =
    StateNotifierProvider<MovieNotifier, MovieState>((ref) => MovieNotifier());

class MovieNotifier extends StateNotifier<MovieState> {
  MovieNotifier() : super(const MovieState()) {
    loadMovies();
  }

  loadMovies() async {
    state = state.copyWith(isLoading: true);
    final moviesList = await MovieService().fetchMovies();
    final movies = moviesList.map((e) => MovieModel.fromJson(e)).toList();
    state = state.copyWith(movies: movies, isLoading: false);
  }

  filterMovies(filter) async {
    state = state.copyWith(isLoading: true);
    final moviesList = await MovieService().fetchMovies();
    final movies = moviesList
        .map((e) => MovieModel.fromJson(e))
        .toList()
        .where((element) =>
        element.name!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    state = state.copyWith(movies: movies, isLoading: false);
  }
}
