/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.embeds-document.plugins-01.html
 * @assertion 
 * @description document.embeds and document.plugins
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

test(() {
  assert_equals(document.embeds, document.plugins);
  assert_equals(document.embeds.length, 0);
  assert_equals(document.plugins.length, 0);
}, "empty document");

test(() {
  document.body.append(document.createElement("embed"));
  assert_equals(document.embeds, document.plugins);
  assert_equals(document.embeds.length, 1);
  assert_equals(document.plugins.length, 1);
  assert_equals(document.embeds[0], document.getElementsByTagName("embed")[0]);
  assert_equals(document.plugins[0], document.getElementsByTagName("embed")[0]);
}, "nonempty document");

}
