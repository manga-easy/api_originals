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
              'href': 'MentallyBroken',
              'capa': '${Configs.ipAplication}/mentally-broken/capa.png',
            }
          ]
        }),
        headers: {'Content-Type': 'application/json; charset=utf-8'});
  }
}
