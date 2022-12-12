import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_test_code/model/movie_model.dart';
import 'package:mahar_test_code/page/detail_page.dart';
import '../provider/movie_provider.dart';
import '../widget/search_item_widget.dart';
import '../widget/search_widget.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<MovieModel> itemFound = ref.watch(moviesProvider).movies;
    bool isLoading = ref.watch(moviesProvider).isLoading ;
    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: SearchWidget(
          enabled: true,
          controller: searchController,
          onSubmitted: (value) async {
            await ref.read(moviesProvider.notifier).filterMovies(value);
          },
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: itemFound.length,
              itemBuilder: (context, index) {
                var items = itemFound[index];
                return SearchItemWidget(
                  image: items.poster,
                  title: "${items.name}",
                  desc: "${items.desc}",
                  iconColor: items.favorite == true ? Colors.red : Colors.grey,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          movie: items,
                        ),
                      ),
                    );
                  },
                );
              }),
    );
  }
}
