/*
 * after web-platform-tests/dom/ranges/Range-detach.html
 *
 * @assertion Range.detach()
 * @description
 * @needsreview in javascript, attributes of detached range are still accessible
 */
import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var r = document.createRange();
  r.detach();
  r.detach();
}
