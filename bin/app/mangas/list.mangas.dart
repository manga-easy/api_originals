import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../core/configs.dart';

class MangasList {
  Response call(Request req) {
    return Response.ok(
        json.encode({
          'data': [
            {
              'id': 'MentallyBroken',
              'title': 'Mentally Broken',
              'href': 'easy-scanMentallyBroken',
              'capa': '${Configs.ipAplication}/mentally-broken/capa.png',
            },
            {
              'id': 'in/habitants',
              'title': 'in/habitants',
              'href': 'easy-scanin/habitants',
              'capa': '${Configs.ipAplication}/in-habitants/capa.png',
            }
          ]
        }),
        headers: {'Content-Type': 'application/json; charset=utf-8'});
  }
}
