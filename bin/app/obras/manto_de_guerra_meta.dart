import 'package:manga_easy_sdk/manga_easy_sdk.dart';

import '../../core/configs.dart';
import 'obra_meta.dart';

class MantoDeGuerra extends ObrasMeta {
  @override
  String get author => 'Guilherme Ferraro';

  @override
  int get chapters => 3;

  @override
  List<Gender> get genders => [
        Gender.fromValue(href: '', title: 'shonen'),
        Gender.fromValue(href: '', title: 'fantasia'),
        Gender.fromValue(href: '', title: 'acao'),
        Gender.fromValue(href: '', title: 'shonen'),
      ];

  @override
  String get uniqueid => Helps.convertUniqueid(title);

  @override
  String get year => '2023';

  @override
  String get sinopse =>
      'Em um mundo viking atormentado pela escuridão, surge uma batalha épica entre humanos e seres demoníacos, chamados Ichiros. Neste mangá emocionante, intitulado "Manto de guerra", mergulhe em uma jornada repleta de ação e mitologia nórdica.';

  @override
  String get status => 'ativo';

  @override
  String get thumb => '${Configs.ipAplication}/$uniqueid/thumb.gif';

  @override
  String get title => 'Manto de Guerra';

  @override
  TypeFonte get contentType => TypeFonte.image;
}
