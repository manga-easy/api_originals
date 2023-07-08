import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import '../../core/configs.dart';
import 'obra_meta.dart';

class MentallyBroken extends ObrasMeta {
  @override
  String get author => 'Maicon Aart';

  @override
  int get chapters => 6;

  @override
  List<Gender> get genders => [
        Gender.fromValue(href: '', title: 'drama'),
        Gender.fromValue(href: '', title: 'suspense'),
        Gender.fromValue(href: '', title: 'Seinen'),
      ];

  @override
  String get uniqueid => Helps.convertUniqueid(title);

  @override
  String get year => '2022';

  @override
  String get sinopse =>
      'Mentally Broken conta a história do Daiki, um escritor que tenta aliviar os traumas do seu passado escrevendo vários livros.\n'
      'Com o tempo ele percebe que as coisas na sua vida continuam piorando... não importa o quanto você tenha sofrido, nada é tão ruim que não possa piorar.';

  @override
  String get status => 'ativo';

  @override
  String get thumb => '${Configs.ipAplication}/$uniqueid/capa.png';

  @override
  String get title => 'Mentally Broken';

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
