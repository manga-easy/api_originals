import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../core/configs.dart';

class Chapt {
  final String number;
  final int quant;
  Chapt(this.number, this.quant);
}

var mentali = [
  Chapt('01', 35),
  Chapt('02', 15),
  Chapt('03', 15),
  Chapt('04', 17),
  Chapt('05', 20),
  Chapt('06', 13)
];
var inhabitants = [Chapt('1', 63), Chapt('2', 20)];

class ImagechapterList {
  Response call(Request req) {
    var manga = req.requestedUri.queryParameters['chapter'];
    manga = manga!.replaceAll('easy-scan', '');
    if (manga.contains('MentallyBroken')) {
      var index = manga.replaceFirst('MentallyBroken', '');
      var chapter = int.parse(index);
      var chapt = mentali.elementAt(--chapter);
      return Response.ok(
        json.encode({
          'data': List.generate(chapt.quant, (index) => index += 1)
              .map(
                (e) => {
                  'id': 'MentallyBroken${chapt.number}$e',
                  'src':
                      '${Configs.ipAplication}/mentally-broken/${chapt.number}/$e.jpg',
                },
              )
              .toList()
        }),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
    }
    if (manga.contains('in/habitants')) {
      var index = manga.replaceFirst('in/habitants', '');
      var chapter = int.parse(index);
      var chapt = inhabitants.elementAt(--chapter);
      return Response.ok(
        json.encode({
          'data': List.generate(chapt.quant, (index) => index += 1)
              .map(
                (e) => {
                  'id': 'in/habitants${chapt.number}$e',
                  'src':
                      '${Configs.ipAplication}/in-habitants/${chapt.number}/$e.jpg',
                },
              )
              .toList()
        }),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
    }
    return Response.ok(json.encode({}));
  }
}
