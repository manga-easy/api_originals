import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import '../../core/configs.dart';
import 'obra_meta.dart';

class InHabitants extends ObrasMeta {
  @override
  String get author => 'In/habitants';

  @override
  int get chapters => 34;

  @override
  List<Gender> get genders => [
        Gender.fromValue(href: '', title: 'drama'),
        Gender.fromValue(href: '', title: 'acao'),
        Gender.fromValue(href: '', title: 'slice of life'),
      ];

  @override
  String get uniqueid => Helps.convertUniqueid(title);

  @override
  String get year => '2022';

  @override
  String get sinopse =>
      'in/habitants é um manga contemporâneo slice-of-life e cyberpunk que acompanha as vidas de seu diverso cast de personagens enquanto navegam em um mundo cheio de tecnologia, injustiças e lutas pessoais. O manga oferece uma perspectiva refrescante na intersecção da sociedade, tecnologia e experiência humana.';

  @override
  String get status => 'ativo';

  @override
  String get thumb => '${Configs.ipAplication}/$uniqueid/capa.png';

  @override
  String get title => 'In/habitants';

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
    return (await listFilesFolder('files/$uniqueid/$id'))
        .map((e) => ImageChapter(
              src: e,
              state: 1,
              tipo: TypeFonte.image,
            ).toJson())
        .toList();
  }
}
