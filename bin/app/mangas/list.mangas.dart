import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../core/response_controller.dart';
import '../obras/obra_meta.dart';

class MangasList extends ResponseController {
  Response call(Request req) {
    return Response.ok(
      json.encode(
        {
          'data': ObrasMeta.onAll.map((e) => e.toManga()).toList(),
        },
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
  }
}
