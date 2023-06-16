import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../core/configs.dart';
import '../obras/etheral_plane_meta_dados.dart';

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
                  'in/habitants é um manga contemporâneo slice-of-life e cyberpunk que acompanha as vidas de seu diverso cast de personagens enquanto navegam em um mundo cheio de tecnologia, injustiças e lutas pessoais. O manga oferece uma perspectiva refrescante na intersecção da sociedade, tecnologia e experiência humana.',
              'generos': [
                {'title': 'drama', 'href': ''},
                {'title': 'slice of life', 'href': ''},
                {'title': 'acao', 'href': ''},
              ],
              'autor': 'in/habitants',
              'artista': 'in/habitants',
              'capitulos': List.generate(27, (index) => index += 1)
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
      case 'EtheralPlane':
        final meta = EtheralPlaneMeta();
        return Response.ok(
          json.encode({'data': meta.toDetaalhesManga()}),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
        );
      default:
        return Response.ok(json.encode({}));
    }
  }
}
