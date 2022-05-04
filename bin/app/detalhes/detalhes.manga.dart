import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../core/configs.dart';

class DetalhesManga {
  Response call(Request req) {
    switch (req.requestedUri.queryParameters['manga']) {
      case 'MentallyBroken':
        return Response.ok(
          json.encode({
            'data': {
              'id': 'MentallyBroken',
              'title': 'Mentally Broken',
              'href': 'MentallyBroken',
              'sinopse':
                  'Mentally Broken conta a história do Daiki, um escritor que tenta aliviar os traumas do seu passado escrevendo vários livros.\n'
                      'Com o tempo ele percebe que as coisas na sua vida continuam piorando... não importa o quanto você tenha sofrido, nada é tão ruim que não possa piorar.',
              'generos': [
                {'title': 'drama', 'href': ''},
                {'title': 'suspense', 'href': ''},
                {'title': 'Seinen', 'href': ''},
              ],
              'autor': 'Maicon Aart',
              'artista': 'Maicon Aart',
              'capitulos': List.generate(3, (index) => index += 1)
                  .map(
                    (e) => {
                      'title': '$e',
                      'href': 'MentallyBroken$e',
                      'id': 'MentallyBroken$e',
                      'imagens': [],
                      'date': DateTime.now().toString(),
                    },
                  )
                  .toList(),
              'ano': '2022',
              'scans': 'Maicon Aart',
              'status': 'Ativo',
              'capa': '${Configs.ipAplication}/mentally-broken/Capa-Mentally-Broken_20220405124026.png',
            }
          }),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
        );
      default:
        return Response.ok(json.encode({}));
    }
  }
}
