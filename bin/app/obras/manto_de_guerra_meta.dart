import 'dart:io';

import 'package:manga_easy_sdk/manga_easy_sdk.dart';

import '../../core/configs.dart';
import 'obra_meta.dart';

class MantoDeGuerra extends ObrasMeta {
  @override
  String get author => 'Guilherme Ferraro';

  @override
  int get chapters => 3;

  @override
  List<Gender> get genders => [
        Gender.fromValue(href: '', title: 'shonen'),
        Gender.fromValue(href: '', title: 'fantasia'),
        Gender.fromValue(href: '', title: 'acao'),
        Gender.fromValue(href: '', title: 'shonen'),
      ];

  @override
  String get uniqueid => Helps.convertUniqueid(title);

  @override
  String get year => '2023';

  @override
  String get sinopse =>
      'Em um mundo viking atormentado pela escuridão, surge uma batalha épica entre humanos e seres demoníacos, chamados Ichiros. Neste mangá emocionante, intitulado "Manto de guerra", mergulhe em uma jornada repleta de ação e mitologia nórdica.';

  @override
  String get status => 'ativo';

  @override
  String get thumb => '${Configs.ipAplication}/$uniqueid/thumb.gif';

  @override
  String get title => 'Manto de Guerra';

  @override
  Map<String, dynamic> toDetaalhesManga() {
    return DetalhesManga(
      uniqueid: uniqueid,
      title: title,
      capa: thumb,
      sinopse: sinopse,
      generos: genders,
      autor: author,
      artista: '',
      capitulos: List.generate(chapters, (index) => index += 1)
          .map((e) => Chapter(
                title: '$e',
                href: 'easy-scan$uniqueid$e',
                id: '$uniqueid$e',
                imagens: [],
                number: e.toDouble(),
                date: DateTime.now().toString(),
              ))
          .toList(),
      ano: year,
      scans: scan,
      status: status,
      idHost: idHost,
    ).toJson();
  }

  @override
  Map<String, dynamic> toManga() {
    return Manga(
      capa: thumb,
      href: 'easy-scan$uniqueid',
      title: title,
      idHost: idHost,
      uniqueid: uniqueid,
    ).toJson();
  }

  @override
  Future<List<Map<String, dynamic>>> imageChaters(String id) async {
    return (await listFilesFolder('files/$uniqueid/$id'))
        .map((e) => ImageChapter(
              src: e,
              state: 1,
              tipo: TypeFonte.image,
            ).toJson())
        .toList();
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

  List<String> sortFilePaths(List<String> filePaths) {
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
