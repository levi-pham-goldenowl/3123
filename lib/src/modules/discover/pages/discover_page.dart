import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/discover/widgets/playlist_favorites_widget.dart';
import 'package:zanmelodic/src/modules/discover/widgets/singer_favorites_widget.dart';
import 'package:zanmelodic/src/modules/discover/widgets/song_favorites_widget.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _headerTitle('Singer'),
            const SingerFavotiresWidget(),
            _headerTitle('Playlist'),
            const PlaylistFavotiresWidget(),
            _headerTitle('Tracks'),
            const SongFavotiresWidget()
          ],
        ),
      ),
    );
  }

  Widget _headerTitle(String title) {
    return SliverToBoxAdapter(
      child: Text(
        title,
        style: Style.textTheme().titleLarge,
      ),
    );
  }
}
