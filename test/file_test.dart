import 'dart:io';

import '../bin/core/configs.dart';

Future<void> main() async {
  print(await listFilesFolder('files/mantodeguerra/1'));
}

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

  return sortFilePaths(
    images
        .map((e) =>
            '${Configs.ipAplication}${e.replaceFirst('files', '').replaceAll(r'\', '/')}')
        .toList(),
  );
}
