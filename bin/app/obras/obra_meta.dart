import 'dart:io';

import 'package:manga_easy_sdk/manga_easy_sdk.dart';

import '../../core/configs.dart';
import 'in_habitants_meta.dart';
import 'etheral_plane_meta_dados.dart';
import 'imperiais_meta.dart';
import 'manto_de_guerra_meta.dart';
import 'mentally_broken.dart';
import 'os_grandes_guardioes_meta.dart';

abstract class ObrasMeta {
  abstract final String uniqueid;
  abstract final String title;
  abstract final String thumb;
  abstract final String author;
  abstract final String year;
  abstract final String status;
  abstract final List<Gender> genders;
  abstract final String sinopse;
  abstract final int chapters;
  final int idHost = 7;
  final String scan = 'Manga Easy Originals';

  Future<List<Map<String, dynamic>>> imageChaters(String id);

  Map<String, dynamic> toManga();

  Map<String, dynamic> toDetaalhesManga();

  static List<ObrasMeta> onAll = [
    MentallyBroken(),
    InHabitants(),
    EtheralPlaneMeta(),
    ImperiaisMeta(),
    MantoDeGuerra(),
    OsGrandesGuardioes(),
  ];

  Future<List<String>> listFilesFolder(String folderPath) async {
    final folder = Directory(folderPath);
    List<String> images = [];

    if (await folder.exists()) {
      await for (var entity in folder.list(recursive: true)) {
        if (entity is File) {
          images.add(entity.path);
        }
      }
    }
    return _sortFilePaths(
      images
          .map((e) =>
              '${Configs.ipAplication}${e.replaceFirst('files', '').replaceAll(r'\', '/')}')
          .toList(),
    );
  }

  List<String> _sortFilePaths(List<String> filePaths) {
    filePaths.sort((a, b) {
      final regex = RegExp(r'(\d+)');
      final matchA =
          regex.allMatches(a).map((match) => match.group(0)).toList();
      final matchB =
          regex.allMatches(b).map((match) => match.group(0)).toList();

      for (int i = 0; i < matchA.length && i < matchB.length; i++) {
        final numberA = int.parse(matchA[i]!);
        final numberB = int.parse(matchB[i]!);

        final comparison = numberA.compareTo(numberB);
        if (comparison != 0) {
          return comparison;
        }
      }

      return matchA.length.compareTo(matchB.length);
    });

    return filePaths;
  }
}
