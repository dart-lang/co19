/*
 * after web-platform-tests/dom/ranges/Range-comparePoint-2.html
 *
 * @assertion Range.comparePoint()
 * @description
 * @needsreview in javascript, attributes of detached range are still accessible
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

  var r = document.createRange();
  r.detach();
  assert_equals(r.comparePoint(document.body, 0), 1);

}