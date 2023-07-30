import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import '../../core/configs.dart';
import 'obra_meta.dart';

class PequenasDesventuras extends ObrasMeta {
  @override
  String get uniqueid => Helps.convertUniqueid(title);
  @override
  String get title => 'Pequenas Desventuras';
  @override
  String get thumb => '${Configs.ipAplication}/$uniqueid/thumb.png';
  @override
  String get author => 'Vitoria Thays';
  @override
  String get year => '2021';
  @override
  String get status => 'ativo';
  @override
  List<Gender> get genders => [
        Gender.fromValue(href: '', title: 'Comedia'),
        Gender.fromValue(href: '', title: 'fantasia'),
      ];
  @override
  String get sinopse =>
      'No mundo de: 3012, uma garota chamada Nicole tem a importante missão de substituir sua mãe no trabalho como entregadora de itens mágicos por aplicativo. ';
  @override
  int get chapters => 1;

  @override
  TypeFonte get contentType => TypeFonte.image;
}
