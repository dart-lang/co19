/*
 * after web-platform-tests/dom/nodes/CharacterData-appendData.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-characterdata-deletedata">
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-characterdata-data">
 * 
 * @description 
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void check(CharacterData node) {
  assert_throws("IndexSizeError", () { node.deleteData(5, 10); });
  assert_throws("IndexSizeError", () { node.deleteData(5, 0) ;});
  node.deleteData(2, 10);
  assert_equals(node.data, "te");
}

void main() {
  check(new Text("test"));
  check(new Comment("test"));
}
