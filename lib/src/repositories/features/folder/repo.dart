import 'package:zanmelodic/src/models/folder_model.dart';
import 'package:zanmelodic/src/models/result.dart';

abstract class FolderRepository {
  Future<XResult<List<XFolder>>> fetchListFolder();
  Future<void> saveFolder(List<XFolder> listFolder);
}
