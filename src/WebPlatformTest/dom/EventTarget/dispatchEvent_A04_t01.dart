/**
 * after web-platform-tests/dom/events/EventTarget-dispatchEvent.html
 *
 * @description Event listeners should be called in order of addition
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var results = [];
  var b = document.createElement("b");

  b.addEventListener("x", (e) {
    asyncEnd();
    results.add(1);
  }, true);
  b.addEventListener("x", (e) {
    asyncEnd();
    results.add(2);
  }, false);
  b.addEventListener("x", (e) {
    asyncEnd();
    results.add(3);
  }, true);

  asyncMultiStart(3);
  b.dispatchEvent(new Event("x"));
  Expect.listEquals(results, [1, 2, 3]);
}
