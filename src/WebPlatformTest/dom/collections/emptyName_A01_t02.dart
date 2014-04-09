/**
 * after web-platform-tests/dom/collections/HTMLCollection-empty-name.html
 *
 * @description Empty string as a name for Element.getElementsByTagName
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  var c = document.getElementsByTagName("*");
  Expect.isFalse(c.contains(""), "Empty string should not be in the collection.");
}