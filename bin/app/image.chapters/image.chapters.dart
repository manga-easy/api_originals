import 'dart:convert';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:shelf/shelf.dart';
import '../../core/response_controller.dart';
import '../obras/obra_meta.dart';

class ImagechapterList extends ResponseController {
  Future<Response> call(Request req) async {
    var manga = req.requestedUri.queryParameters['chapter'];
    manga = manga!.replaceAll('easy-scan', '');
    manga = Helps.convertUniqueid(manga);
    for (var element in ObrasMeta.onAll) {
      if (manga.contains(element.uniqueid)) {
        var index = manga.replaceFirst(element.uniqueid, '');
        var images = await element.imageChaters(index);
        return response(images);
      }
    }
    return Response.ok(json.encode({}));
  }
}
