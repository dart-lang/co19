/**
 * after web-platform-tests/dom/collections/HTMLCollection-empty-name.html
 *
 * @description Empty string as a name for Element.children
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  var c = document.body.children;
  Expect.isFalse(c.contains(""), "Empty string should not be in the collection.");
}