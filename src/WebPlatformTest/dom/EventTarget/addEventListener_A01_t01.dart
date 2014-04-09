/**
 * after web-platform-tests/dom/events/EventTarget-addEventListener.html
 *
 * @assertion http://dom.spec.whatwg.org/#dom-eventtarget-addeventlistener
 * @description Adding a null event listener should succeed
 * @needsreview dom.spec.whatwg.org spec differs from the dart's one
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  document.addEventListener("x", null, false);
  document.addEventListener("x", null, true);
  document.addEventListener("x", null);
}
