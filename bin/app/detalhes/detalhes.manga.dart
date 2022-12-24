import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../core/configs.dart';

class DetalhesManga {
  Response call(Request req) {
    var manga = req.requestedUri.queryParameters['manga'];
    manga = manga!.replaceAll('easy-scan', '');
    switch (manga) {
      case 'MentallyBroken':
        return Response.ok(
          json.encode({
            'data': {
              'id': 'MentallyBroken',
              'title': 'Mentally Broken',
              'href': 'easy-scanMentallyBroken',
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
              'capitulos': List.generate(6, (index) => index += 1)
                  .map(
                    (e) => {
                      'title': '$e',
                      'href': 'easy-scanMentallyBroken$e',
                      'id': 'MentallyBroken$e',
                      'number': e,
                      'imagens': [],
                      'date': DateTime.now().toString(),
                    },
                  )
                  .toList(),
              'ano': '2022',
              'scans': 'Maicon Aart',
              'status': 'Ativo',
              'capa': '${Configs.ipAplication}/mentally-broken/capa.png',
            }
          }),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
        );
      case 'in/habitants':
        return Response.ok(
          json.encode({
            'data': {
              'id': 'in/habitants',
              'title': 'In/habitants',
              'href': 'easy-scanin/habitants',
              'sinopse':
                  'Em um mundo não muito diferente deste, os menos afortunados da população devem lutar para sobreviver. Quando um grupo de desajustados se reúne e descobre que compartilha dores semelhantes, eles decidem combinar suas forças.\n'
                      'Usando tecnologia de ponta, eles decidem reconstruir o status quo e criar um novo mundo mais receptivo a todos. Ou pelo menos era o que eles esperavam.\n'
                      'Mais em: inhabitants.zone',
              'generos': [
                {'title': 'drama', 'href': ''},
                {'title': 'slice of life', 'href': ''},
                {'title': 'acao', 'href': ''},
              ],
              'autor': 'in/habitants',
              'artista': 'in/habitants',
              'capitulos': List.generate(7, (index) => index += 1)
                  .map(
                    (e) => {
                      'title': '$e',
                      'href': 'easy-scanin/habitants$e',
                      'id': 'in/habitants$e',
                      'number': e,
                      'imagens': [],
                      'date': DateTime.now().toString(),
                    },
                  )
                  .toList(),
              'ano': '2022',
              'scans': 'in/habitants',
              'status': 'Ativo',
              'capa': '${Configs.ipAplication}/in-habitants/capa.png',
            }
          }),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
        );
      default:
        return Response.ok(json.encode({}));
    }
  }
}
