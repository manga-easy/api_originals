import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../core/configs.dart';

class ImagechapterList {
  Response call(Request req) {
    switch (req.requestedUri.queryParameters['chapter']) {
      case 'MentallyBroken1':
        return Response.ok(
          json.encode({
            'data': List.generate(35, (index) => index += 1)
                .map(
                  (e) => {
                    'id': 'MentallyBroken01$e',
                    'src': '${Configs.ipAplication}/mentally-broken/01/$e.jpg',
                  },
                )
                .toList()
          }),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
        );
      case 'MentallyBroken2':
        return Response.ok(
          json.encode({
            'data': List.generate(15, (index) => index += 1)
                .map(
                  (e) => {
                    'id': 'MentallyBroken02$e',
                    'src': '${Configs.ipAplication}/mentally-broken/02/$e.jpg',
                  },
                )
                .toList()
          }),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
        );
      case 'MentallyBroken3':
        return Response.ok(
          json.encode({
            'data': List.generate(15, (index) => index += 1)
                .map(
                  (e) => {
                    'id': 'MentallyBroken03$e',
                    'src': '${Configs.ipAplication}/mentally-broken/03/$e.jpg',
                  },
                )
                .toList()
          }),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
        );

      default:
        return Response.ok(json.encode({}));
    }
  }
}
