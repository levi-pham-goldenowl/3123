import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/custom_bar/upper_control_bar.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';

class AppBarPlaylistDetail extends StatelessWidget {
  const AppBarPlaylistDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hStatusBar = MediaQuery.of(context).viewPadding.top;
    const hExpanded = 350.0;
    const hToolbar = 320.0;

    return BlocBuilder<PlaylistDetailBloc, PlaylistDetailState>(
      builder: (context, state) {
        final _playlist = state.playlist;

        return SliverAppBar(
            backgroundColor: MyColors.colorBlack,
            stretch: true,
            pinned: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: hToolbar,
            expandedHeight: hExpanded,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              bool isCollapsed = constraints.maxHeight < hExpanded + hStatusBar;
              return SafeArea(
                child: Container(
                  color:
                      isCollapsed ? MyColors.colorGreen : MyColors.colorBlack,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _playlist.playlist,
                          style: Style.textTheme()
                              .displaySmall!
                              .copyWith(fontSize: 25),
                        ),
                        Text(
                          'By: ${_playlist.dateAdded} | ${XUtil.formatNumberSong(_playlist.numOfSongs)}',
                          style: Style.textTheme().titleMedium!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: MyColors.colorGray),
                        ),
                        isCollapsed
                            ? CustomImageWidget(
                                id: _playlist.id,
                                height: 190,
                                width: double.infinity,
                                artworkType: ArtworkType.PLAYLIST,
                                isShadow: true,
                              )
                            : CustomImageWidget(
                                id: _playlist.id,
                                height: 220,
                                width: 220,
                                artworkType: ArtworkType.PLAYLIST,
                                isShadow: true,
                              ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: UpperControlBar(
                              iconShuffle: state.shuffleIcon,
                              iconSort: state.sortIcon,
                              onPressedSort: () => context
                                  .read<PlaylistDetailBloc>()
                                  .onSortNameToList(),
                              onPressedShuffle: () => context
                                  .read<PlaylistDetailBloc>()
                                  .onShuffleToList(),
                              onPressedPlayer: () => context
                                  .read<PlayMusicBloc>()
                                  .onPlayerItem(
                                      songList: state.items.data ?? []),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }));
      },
    );
  }
}
