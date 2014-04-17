/*
 * after web-platform-tests/dom/nodes/DocumentType-remove.html
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-childnode-remove">
 *
 * @assertion DocumentType.remove()
 *
 * @description 
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";
import "ChildNodeRemove.dart";

void main() {

test(() {
  var node = document.implementation.createDocumentType("html", "", "");
  var parent = document.implementation.createDocument(null, "", null);
  testRemove(node, parent, "doctype");
}, "testRemove");

checkTestFailures();
}
