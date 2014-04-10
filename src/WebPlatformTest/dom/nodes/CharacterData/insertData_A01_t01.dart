/*
 * after web-platform-tests/dom/nodes/CharacterData-appendData.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-characterdata-insertdata">
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-characterdata-data">
 * 
 * @description 
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void check(CharacterData node) {
  assert_throws("IndexSizeError", () { node.insertData(5, "x"); });
  assert_throws("IndexSizeError", () { node.insertData(5, ""); });
  node.insertData(2, "X");
  assert_equals(node.data, "teXst");
}

void main() {
  check(new Text("test"));
  check(new Comment("test"));
}
