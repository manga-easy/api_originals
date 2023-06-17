import 'dart:io';

import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_sdk/src/modules/manga/gender.dart';

import '../../core/configs.dart';
import 'obra_meta.dart';

class ImperiaisMeta extends ObrasMeta {
  @override
  String get author => 'Rodsa';

  @override
  int get chapters => 2;

  @override
  List<Gender> get genders => [];

  @override
  String get uniqueid => Helps.convertUniqueid(title);

  @override
  String get year => '2023';

  @override
  String get sinopse =>
      'Em um universo fantástico, dividido em cinco reinos, cada um com características únicas e sociedades distintas, a história se passa no Reino Imperial, governado por uma rainha benevolente, mas que enfrenta conflitos políticos e desafios em seu reinado. Entre eles, o desafio de escolher um sucessor.\n'
      'A cerimônia de coroação da escolhida, Yhora, começa com grande pompa e circunstância, reunindo líderes dos outros reinos em uma celebração de paz e união. Mas as tensões logo surgem quando a representante do Reino das Montanhas faz uma acusação pública contra o antigo rei Imperial, pai de Yhora.\n'
      'A festa pós-cerimônia é transformada em um cenário de ameaças de guerra e disputas políticas, com a prisão do antigo rei ordenada por Yhora. O pai da nova rainha, no entanto, provoca um conflito com o príncipe dos representantes das montanhas, o que leva a uma declaração não oficial de guerra.\n'
      'A situação se agrava, mas Yhora, com sua determinação e astúcia, busca uma solução pacífica e justa para evitar uma guerra devastadora. Com a ajuda de seus aliados e conselheiros, ela é capaz de encontrar uma solução que preserva a paz e a unidade dos reinos.\n'
      'Ao final, Yhora é coroada como a nova rainha do Reino Imperial, com a promessa de liderar seu povo com sabedoria e justiça. A história mostra que mesmo em um mundo dividido por diferenças e conflitos, a diplomacia e o diálogo podem vencer a guerra e manter a paz e a harmonia entre os povos.\n';

  @override
  String get status => 'ativo';

  @override
  String get thumb => '${Configs.ipAplication}/$uniqueid/thumb.jpg';

  @override
  String get title => 'Imperiais';

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
  Future<List<Map<String, dynamic>>> imageChaters(String id) async {
    return [
      ImageChapter(
        src: await File('files/$uniqueid/$id.htm').readAsString(),
        state: 1,
        tipo: TypeFonte.text,
      ).toJson()
    ];
  }
}
