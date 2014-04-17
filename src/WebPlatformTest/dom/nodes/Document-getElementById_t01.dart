/*
 * after web-platform-tests/dom/nodes/Document-getElementById.html
 * <link rel=help href="http://dom.spec.whatwg.org/#dom-document-createevent">
 *
 * @assertion Document.getElementById()
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-getelementbyid">
 * The getElementById(elementId) method must return the first element, in tree order, 
 * within the context object's tree, whose ID is elementId, or null if there is none.
 * 
 * An element has an ID if it has an id attribute whose value is not the empty string.
 *
 * @description Document.getElementById with an empty string
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
test(() {
  var x = new Element.html('<div id=""></div>');
  document.body.append(x);
  assert_equals(document.getElementById(""), null);
  // XXX needs more tests
}, "empty string is not an ID");

checkTestFailures();
}
