/**
 * after web-platform-tests/dom/collections/HTMLCollection-empty-name.html
 *
 * @description Empty string as a name for Element.getElementsByTagNameNS
 * @needsreview find equivalent of javasrcipt's getElementsByTagName
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  return;
  var div = document.getElementById("test");
  var c = div.getElementsByTagNameNS("http://www.w3.org/1999/xhtml", "a");
  Expect.isFalse(c.contains(""), "Empty string should not be in the collection.");
}