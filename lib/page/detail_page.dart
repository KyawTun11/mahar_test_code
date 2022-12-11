import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller_provider/color_provider.dart';
import '../controller_provider/local_storage_provider.dart';
import '../model/movie_model.dart';
import '../widget/video_player_widget.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorValue = ref.watch(colorProvider);
    final favoriteIds = ref.watch(FavoriteIds.provider);
    return Scaffold(
      appBar: AppBar(
        title: Text("${movie.name}"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayerWidget(
                videoUrl: movie.movie,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${movie.desc}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: ref.read(colorProvider.notifier).isFavorite
                        ? Colors.red
                        : Colors.grey,
                  ),
                  onPressed: () {
                    ref.read(colorProvider.notifier).toggleFavorite();

                    if (ref.read(colorProvider.notifier).isFavorite) {
                      ref
                          .read(FavoriteIds.provider.notifier)
                          .toggle(movie.id.toString());
                    } else {
                      //removeFavorite(movie.favorite);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
