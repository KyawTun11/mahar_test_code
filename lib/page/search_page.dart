import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/movie_model.dart';
import '../provider/movie_provider.dart';
import '../widget/search_item_widget.dart';
import '../widget/search_widget.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    List<MovieModel> movies = ref.watch(moviesProvider).movies;
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
          searchOnTap: () {},
          onSubmitted: (String? value) {},
        ),
      ),
      body: InkWell(
        onTap: (){
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => Detail(movie: movie,
          //     ),
          //   ),
          // );
        },
        child: SearchItemWidget(
          image:
          "https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_SX300.jpg",
          title: "Name",
          desc: "Dec..................",
        ),
      ),
    );
  }
}
