import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/result.dart';

abstract class PlaylistRepository {
  Future<XResult<List<PlaylistModel>>> getListOfPlaylist();
  Future<XResult<List<PlaylistModel>>> addNewPlaylist(String name);
  Future<XResult<List<PlaylistModel>>> removePlaylist(int idPlaylist);
  Future<XResult> addToPlaylist({required int idPlaylist, required int idSong});

  Future<XResult<List<SongModel>>> getListOfSongFromPlaylist(int idPlaylist);
}
