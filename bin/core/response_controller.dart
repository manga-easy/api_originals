import 'dart:convert';

import 'package:shelf/shelf.dart';

class ResponseController {
  Response response(data) {
    return Response.ok(
      json.encode(
        {
          'data': data,
        },
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
  }
}
