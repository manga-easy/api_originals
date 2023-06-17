import 'dart:io';

import 'package:manga_easy_sdk/manga_easy_sdk.dart';

import '../../core/configs.dart';
import 'obra_meta.dart';

class EtheralPlaneMeta extends ObrasMeta {
  @override
  final String uniqueid = 'EtheralPlane';
  @override
  final String title = 'Etheral Plane';
  @override
  final String thumb = '${Configs.ipAplication}/etheral-plane/thumb.png';
  @override
  final String author = 'Anyca';
  @override
  final String year = '2022';
  @override
  final String status = 'ativo';
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
  final int chapters = 2;

  @override
  Future<Map<String, dynamic>?> imageChaters(String id) async {
    return ImageChapter(
      src: await File('/app/files/etheral-plane/$id.html').readAsString(),
      state: 1,
      tipo: TypeFonte.text,
    ).toJson();
  }

  @override
  Map<String, dynamic> toManga() {
    return {
      'id': uniqueid,
      'title': title,
      'href': 'easy-scan$uniqueid',
      'capa': thumb,
    };
  }

  @override
  Map<String, dynamic> toDetaalhesManga() {
    return {
      'id': uniqueid,
      'title': title,
      'href': 'easy-scan$uniqueid',
      'capa': thumb,
      'sinopse': sinopse,
      'generos': genders.map((e) => e.toJson()).toList(),
      'autor': author,
      'capitulos': List.generate(chapters, (index) => index += 1)
          .map(
            (e) => {
              'title': '$e',
              'href': 'easy-scan$uniqueid$e',
              'id': '$uniqueid$e',
              'number': e,
              'imagens': [],
              'date': DateTime.now().toString(),
            },
          )
          .toList(),
      'ano': year,
      'scans': 'Manga Easy Originals',
      'status': status,
      'artista': '',
    };
  }
}
