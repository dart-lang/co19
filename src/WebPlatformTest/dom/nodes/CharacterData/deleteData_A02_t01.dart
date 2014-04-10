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
  node.data = "test";
  assert_equals(node.data, "test");
  node.deleteData(1, 1);
  assert_equals(node.data, "tst");
}

void main() {
  check(new Text("test"));
  check(new Comment("test"));
}
