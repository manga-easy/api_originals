import 'package:manga_easy_sdk/manga_easy_sdk.dart';

import '../../core/configs.dart';
import 'obra_meta.dart';

class OsGrandesGuardioes extends ObrasMeta {
  @override
  String get author => 'Davi Yared';

  @override
  int get chapters => 13;

  @override
  List<Gender> get genders => [
        Gender.fromValue(href: '', title: 'shonen'),
        Gender.fromValue(title: 'acao', href: ''),
        Gender.fromValue(title: 'aventura ', href: ''),
        Gender.fromValue(title: 'poderes', href: ''),
      ];

  @override
  String get uniqueid => Helps.convertUniqueid(title);

  @override
  String get year => '2023';

  @override
  String get sinopse =>
      'Sinopse: No início dos tempos, um Deus chamado Ligthering criou seu filho, que se tornou o guardião responsável por cuidar de todo o equilíbrio do universo. Ligthering criou mais quatro filhos, que se tornaram planetas e guardiões deles. Esses planetas abrigavam vida e  seres vivos com talentos especiais, conhecidos como Monsters. Houve incontáveis guerras pela posse dos Monsters, e após muitos anos, o planeta Dayrados alcançou a paz, mas apenas temporariamente,'
      'pois ninguém estava preparado para um golpe de estado que obrigou o portador da Fênix a deixar Dayrados e vir para a Terra, na esperança de proteger seu Monster e se tornar um guardião da Terra.';

  @override
  String get status => 'ativo';

  @override
  String get thumb => '${Configs.ipAplication}/$uniqueid/thumb.jpg';

  @override
  String get title => 'Os Grandes Guardiões';

  @override
  TypeFonte get contentType => TypeFonte.text;
}
