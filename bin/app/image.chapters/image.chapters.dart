import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../core/configs.dart';
import '../../core/response_controller.dart';
import '../obras/etheral_plane_meta_dados.dart';
import '../obras/imperiais_meta.dart';

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
var inhabitants = [
  Chapt('1', 63),
  Chapt('2', 73),
  Chapt('3', 67),
  Chapt('4', 56),
  Chapt('5', 41),
  Chapt('6', 46),
  Chapt('7', 33),
  Chapt('8', 37),
  Chapt('9', 35),
  Chapt('10', 41),
  Chapt('11', 33),
  Chapt('12', 34),
  Chapt('13', 34),
  Chapt('14', 35),
  Chapt('15', 39),
  Chapt('16', 33),
  Chapt('17', 38),
  Chapt('18', 40),
  Chapt('19', 36),
  Chapt('20', 34),
  Chapt('21', 36),
  Chapt('22', 26),
  Chapt('23', 22),
  Chapt('24', 20),
  Chapt('25', 21),
  Chapt('26', 24),
  Chapt('27', 25),
];

class ImagechapterList extends ResponseController {
  final ImperiaisMeta _imperiaisMeta = ImperiaisMeta();
  Future<Response> call(Request req) async {
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
    if (manga.contains('EtheralPlane')) {
      final meta = EtheralPlaneMeta();
      var index = manga.replaceFirst('EtheralPlane', '');
      return Response.ok(
        json.encode({
          'data': [
            await meta.imageChaters(index),
          ]
        }),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
    }
    if (manga.contains(_imperiaisMeta.uniqueid)) {
      var index = manga.replaceFirst(_imperiaisMeta.uniqueid, '');
      var images = await _imperiaisMeta.imageChaters(index);
      return response(images);
    }
    return Response.ok(json.encode({}));
  }
}
