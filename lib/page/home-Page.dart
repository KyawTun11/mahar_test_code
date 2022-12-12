import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_test_code/page/detail_page.dart';
import '../controller_provider/local_storage_provider.dart';
import '../model/movie_model.dart';
import '../provider/movie_provider.dart';
import '../widget/movie_cart.dart';
import '../widget/my_app_bar_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var localStorage = ref.read(IsFavorite.provider.notifier);
    List<MovieModel> movies = ref.watch(moviesProvider).movies.map((e) {
      e.favorite = localStorage.getFavorite(e.id!) ?? false;
      return e;
    }).toList();
    bool isLoading = ref.watch(moviesProvider).isLoading;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: MyAppBarWidget(),
      ),
      body: isLoading
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
              },
            ),
    );
  }
}
