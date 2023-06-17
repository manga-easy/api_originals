import 'package:manga_easy_sdk/manga_easy_sdk.dart';

abstract class ObrasMeta {
  abstract final String uniqueid;
  abstract final String title;
  abstract final String thumb;
  abstract final String author;
  abstract final String year;
  abstract final String status;
  abstract final List<Gender> genders;
  abstract final String sinopse;
  abstract final int chapters;
  final int idHost = 7;
  final String scan = 'Manga Easy Originals';

  Future<Map<String, dynamic>?> imageChaters(String id);

  Map<String, dynamic> toManga();

  Map<String, dynamic> toDetaalhesManga();
}
