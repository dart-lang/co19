/**
 * after web-platform-tests/dom/events/Event-defaultPrevented.html
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  var ev = new Event("foo", canBubble:true, cancelable:false);
  Expect.isTrue(ev.bubbles, "bubbles");
  Expect.isFalse(ev.cancelable, "cancelable");
  Expect.isFalse(ev.defaultPrevented, "defaultPrevented");
}
