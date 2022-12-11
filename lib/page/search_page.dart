import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller_provider/search_provider.dart';
import '../widget/search_item_widget.dart';
import '../widget/search_widget.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    final search = ref.watch(searchProvider);
    final itemFound = ref.watch(searchItemProvider);
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
          onSubmitted: (value) {
            // search = value;
          },
        ),
      ),
      body: ListView.builder(
          itemCount: itemFound.length,
          itemBuilder: (context, index) {
            var items = itemFound[index];
            return SearchItemWidget(
              image: items.poster,
              title: "${items.name}",
              desc: "${items.desc}",
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Detail(movie: movie,
                //     ),
                //   ),
                // );
              },
            );
          }),
    );
  }
}
