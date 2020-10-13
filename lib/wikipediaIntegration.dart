import 'package:dartpedia/dartpedia.dart' as wiki;
import 'package:labelcheck/functions.dart';

searchWiki(String topic) async {
  return await wiki.search(topic);
}

openWiki(topic) async {
  var page = await wiki.page(topic.first);
  launchURL(page.url);
}
