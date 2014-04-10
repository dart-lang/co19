/*
 * after web-platform-tests/dom/nodes/CharacterData-appendData.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-childnode-remove">
 * 
 * @description remove() should work if Comment node does have a parent and siblings
 */

import 'dart:html';
import "../ChildNodeRemove.dart";

void main() {
  var node = new Comment("test");
  var parent = document.createElement("div");
  testRemoveSibling(node, parent, "comment");
}