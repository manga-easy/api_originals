import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';
import 'app/detalhes/detalhes.manga.dart';
import 'app/image.chapters/image.chapters.dart';
import 'app/mangas/list.mangas.dart';
import 'core/middlewares/authorize.dart';
import 'core/configs.dart';

// Configure routes.
final _router = Router()
  ..get('/manga', MangasList())
  ..get('/detalhesmanga', DetalhesManga())
  ..get('/imagechapter', ImagechapterList());

var files = createStaticHandler(
  'files',
  useHeaderBytesForContentType: true,
);
void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.loopbackIPv4;
  final cascade = Cascade().add(files).add(_router);
  // Configure a pipeline that logs requests.
  final _handler =
      Pipeline().addMiddleware(logRequests()).addMiddleware(Authorize()).addHandler(cascade.handler);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Configs.portAplication);
  await serve(_handler, ip, port);
  print('Server listening on port http://${Configs.ipAplication}:${Configs.portAplication}');
}
