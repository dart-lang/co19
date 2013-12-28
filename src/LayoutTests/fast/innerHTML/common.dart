import 'dart:html';
import '../../../Utils/expect.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {}
}

var doc = document.implementation.createHtmlDocument('qwe');

init(text) {
  doc.body.setInnerHtml(text, treeSanitizer: new NoCheck());
}

checkText(expected) {
  Expect.equals(expected, doc.body.text);
}