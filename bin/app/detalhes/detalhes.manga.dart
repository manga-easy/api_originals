import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:shelf/shelf.dart';
import '../../core/response_controller.dart';
import '../obras/obra_meta.dart';

class DetalhesManga extends ResponseController {
  Response call(Request req) {
    var manga = req.requestedUri.queryParameters['manga'];
    manga = manga!.replaceAll('easy-scan', '');
    manga = Helps.convertUniqueid(manga);
    for (var element in ObrasMeta.onAll) {
      if (Helps.convertUniqueid(manga) == element.uniqueid) {
        return response(element.toDetaalhesManga());
      }
    }

    return response({});
  }
}
