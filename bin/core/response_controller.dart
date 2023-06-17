import 'dart:convert';

import 'package:shelf/shelf.dart';

class ResponseController {
  Response response(Map<String, dynamic> data) {
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
