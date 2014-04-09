/**
 * after web-platform-tests/dom/events/EventTarget-addEventListener.html
 *
 * @assertion  http://dom.spec.whatwg.org/#dom-eventtarget-removeeventlistener
 * @description removing a null event listener should succeed
 * @needsreview dom.spec.whatwg.org spec differs from the dart's one
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  document.removeEventListener("x", null, false);
  document.removeEventListener("x", null, true);
  document.removeEventListener("x", null);
}
