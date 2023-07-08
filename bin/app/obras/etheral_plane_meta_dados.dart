import 'dart:io';

import 'package:manga_easy_sdk/manga_easy_sdk.dart';

import '../../core/configs.dart';
import 'obra_meta.dart';

class EtheralPlaneMeta extends ObrasMeta {
  @override
  String get uniqueid => Helps.convertUniqueid(title);

  @override
  String get title => 'Etheral Plane';

  @override
  String get thumb => '${Configs.ipAplication}/$uniqueid/thumb.png';

  @override
  String get author => 'Anyca';

  @override
  String get year => '2022';

  @override
  String get status => 'ativo';

  @override
  final List<Gender> genders = [
    Gender.fromValue(href: '', title: 'acao'),
    Gender.fromValue(title: 'aventura', href: ''),
    Gender.fromValue(title: 'comedia', href: ''),
    Gender.fromValue(title: 'fantasia', href: ''),
    Gender.fromValue(title: 'historico', href: ''),
    Gender.fromValue(title: 'poderes', href: ''),
    Gender.fromValue(title: 'romance', href: ''),
  ];
  @override
  final String sinopse =
      'Após ser abandonado em uma montanha gelada e isolada, Touh misteriosamente sobreviveu a morte. Anos depois, ele reencontra seu passado, junto com o desejo de saber quem o deixou para morrer anos atrás.';
  @override
  final int chapters = 3;

  @override
  Future<List<Map<String, dynamic>>> imageChaters(String id) async {
    var file = File('files/$uniqueid/$id.htm');
    if (!await file.exists()) {
      file = File('files/$uniqueid/$id.html');
    }
    if (!await file.exists()) {
      return [];
    }
    return [
      ImageChapter(
        src: await file.readAsString(),
        state: 1,
        tipo: TypeFonte.text,
      ).toJson()
    ];
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
  Map<String, dynamic> toDetaalhesManga() {
    return DetalhesManga(
      uniqueid: uniqueid,
      title: title,
      capa: thumb,
      sinopse: sinopse,
      generos: genders,
      autor: author,
      artista: author,
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
}
