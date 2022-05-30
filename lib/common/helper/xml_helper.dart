import 'package:xml2json/xml2json.dart';

String xmlToJson(String body) {
  final Xml2Json xml2json = Xml2Json();
  xml2json.parse(body);
  return xml2json.toParker();
}
