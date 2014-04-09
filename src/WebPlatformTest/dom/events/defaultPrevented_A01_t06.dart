/**
 * after web-platform-tests/dom/events/Event-defaultPrevented.html
 *
 * @description initEvent should unset defaultPrevented.
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  var ev = new Event("foo", canBubble:true, cancelable:true);
  Expect.isTrue(ev.bubbles, "bubbles");
  Expect.isTrue(ev.cancelable, "cancelable");
  Expect.isFalse(ev.defaultPrevented, "defaultPrevented");
}
