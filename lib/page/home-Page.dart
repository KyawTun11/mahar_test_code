import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_test_code/page/detail_page.dart';
import '../model/movie_model.dart';
import '../provider/movie_provider.dart';
import '../widget/movie_cart.dart';
import '../widget/search_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<MovieModel> movies = ref.watch(moviesProvider).movies;
    final searchController = TextEditingController();
    bool isLoading = ref.watch(moviesProvider).isLoading;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: SearchWidget(
                  enabled: true,
                  controller: searchController,
                  onSubmitted: (value) async {
                    await ref.read(moviesProvider.notifier).filterMovies(value);
                  },
                ),
              ),
              isLoading
                  ? const Center(
                    child: CircularProgressIndicator(),
                  )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        MovieModel movie = movies[index];
                        return InkWell(
                          child: MovieCard(movie: movie),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  movie: movies[index],
                                ),
                              ),
                            );
                          },
                        );
                      }),
            ],
          ),
        ));
  }
}
