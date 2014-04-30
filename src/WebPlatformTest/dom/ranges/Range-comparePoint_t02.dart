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

/* -- extracted into seoarate test Range-comparePoint_t03.dart
test(() {
  var r = document.createRange();
  r.detach();
  assert_equals(r.comparePoint(document.body, 0), 1);
}, "detached");
*/

test(() {
  var r = document.createRange();
  assert_throws("HierarchyRequestError", () { r.comparePoint(null, 0); });
}, "null");

test(() {
  var doc = document.implementation.createHtmlDocument("tralala");
  var r = document.createRange();
  assert_throws("WrongDocumentError", () { r.comparePoint(doc.body, 0); });
}, "zero");

checkTestFailures();
}