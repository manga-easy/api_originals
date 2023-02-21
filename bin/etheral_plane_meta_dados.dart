import 'dart:io';

import 'package:manga_easy_sdk/manga_easy_sdk.dart';

import 'core/configs.dart';

class EtheralPlaneMeta {
  final String uniqueid = 'EtheralPlane';
  final String title = 'Etheral Plane';
  final String thumb = '${Configs.ipAplication}/etheral-plane/thumb.png';
  final String author = 'Anyca';
  final String year = '2022';
  final String status = 'ativo';
  final List<Gender> genders = [
    Gender.fromValue(href: '', title: 'acao'),
    Gender.fromValue(title: 'aventura', href: ''),
    Gender.fromValue(title: 'comedia', href: ''),
    Gender.fromValue(title: 'fantasia', href: ''),
    Gender.fromValue(title: 'historico', href: ''),
    Gender.fromValue(title: 'poderes', href: ''),
    Gender.fromValue(title: 'romance', href: ''),
  ];
  final String sinopse =
      'Após ser abandonado em uma montanha gelada e isolada, Touh misteriosamente sobreviveu a morte. Anos depois, ele reencontra seu passado, junto com o desejo de saber quem o deixou para morrer anos atrás.';
  final int chapters = 1;

  Future<Map<String, dynamic>?> imageChaters(String id) async {
    switch (id) {
      case '1':
        return ImageChapter(
          src: await File('/app/files/etheral-plane/$id.html').readAsString(),
          state: 1,
          tipo: TypeFonte.text,
        ).toJson();
      default:
        return null;
    }
  }

  Map<String, dynamic> toManga() {
    return {
      'id': uniqueid,
      'title': title,
      'href': 'easy-scan$uniqueid',
      'capa': thumb,
    };
  }

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
