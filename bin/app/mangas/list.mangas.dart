import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../core/configs.dart';
import '../../core/response_controller.dart';
import '../obras/etheral_plane_meta_dados.dart';
import '../obras/imperiais_meta.dart';
import '../obras/manto_de_guerra_meta.dart';
import '../obras/os_grandes_guardioes_meta.dart';

class MangasList extends ResponseController {
  final EtheralPlaneMeta etheralPlaneMeta = EtheralPlaneMeta();
  final ImperiaisMeta imperiaisMeta = ImperiaisMeta();
  final OsGrandesGuardioes osGrandesGuardioes = OsGrandesGuardioes();
  final MantoDeGuerra mantoDeGuerra = MantoDeGuerra();
  Response call(Request req) {
    return Response.ok(
      json.encode({
        'data': [
          {
            'id': 'MentallyBroken',
            'title': 'Mentally Broken',
            'href': 'easy-scanMentallyBroken',
            'capa': '${Configs.ipAplication}/mentally-broken/capa.png',
          },
          {
            'id': 'in/habitants',
            'title': 'in/habitants',
            'href': 'easy-scanin/habitants',
            'capa': '${Configs.ipAplication}/in-habitants/capa.png',
          },
          etheralPlaneMeta.toManga(),
          imperiaisMeta.toManga(),
          osGrandesGuardioes.toManga(),
          mantoDeGuerra.toManga(),
        ]
      }),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
  }
}
