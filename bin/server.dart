import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'authorize.dart';
import 'core/configs.dart';

// Configure routes.
final _router = Router();
void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.loopbackIPv4;

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(logRequests()).addMiddleware(Authorize()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Configs.portAplication);
  await serve(_handler, ip, port);
  print('Server listening on port http://${Configs.ipAplication}:${Configs.portAplication}');
}
