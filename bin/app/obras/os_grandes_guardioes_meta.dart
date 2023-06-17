import 'dart:io';

import 'package:manga_easy_sdk/manga_easy_sdk.dart';

import '../../core/configs.dart';
import 'obra_meta.dart';

class OsGrandesGuardioes extends ObrasMeta {
  @override
  String get author => 'Davi Yared';

  @override
  int get chapters => 7;

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
      'No início dos tempos, um Deus chamado Ligthering criou seu filho, Ligthering, que se tornou um guardião responsável por cuidar de todo o universo. Ligthering criou mais quatro filhos, que se tornaram planetas e guardiões deles. Esses planetas abrigavam vida e pessoas com dons especiais, conhecidos como Monsters. Houve guerras pela posse dos Monsters, e após muitos anos, o planeta Dayrados encontrou a paz, mas apenas temporariamente, pois vilões fizeram um golpe de estado e obrigaram o descendente da Fênix a deixar seu planeta e vir para a Terra, na esperança de proteger seu Monster e se tornar um guardião da Terra. ';

  @override
  String get status => 'ativo';

  @override
  String get thumb => '${Configs.ipAplication}/$uniqueid/thumb.jpg';

  @override
  String get title => 'Os Grandes Guardiões';

  @override
  Map<String, dynamic> toDetaalhesManga() {
    return DetalhesManga(
      uniqueid: uniqueid,
      title: title,
      capa: thumb,
      sinopse: sinopse,
      generos: genders,
      autor: author,
      artista: '',
      capitulos: List.generate(chapters, (index) => index += 1)
          .map((e) => Chapter(
                title: '$e',
                href: 'easy-scan$uniqueid$e',
                id: '$uniqueid$e',
                imagens: [],
                number: e.toDouble(),
                date: DateTime.now().toString(),
              ))
          .toList(),
      ano: year,
      scans: scan,
      status: status,
      idHost: idHost,
    ).toJson();
  }

  @override
  Map<String, dynamic> toManga() {
    return Manga(
      capa: thumb,
      href: 'easy-scan$uniqueid',
      title: title,
      idHost: idHost,
      uniqueid: uniqueid,
    ).toJson();
  }

  @override
  Future<Map<String, dynamic>> imageChaters(String id) async {
    return ImageChapter(
      src: await File('files/$uniqueid/$id.html').readAsString(),
      state: 1,
      tipo: TypeFonte.text,
    ).toJson();
  }
}
