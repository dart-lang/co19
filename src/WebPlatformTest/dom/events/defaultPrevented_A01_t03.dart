/**
 * after web-platform-tests/dom/events/Event-defaultPrevented.html
 *
 * @description preventDefault() should not change defaultPrevented if cancelable is false.
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  var ev = new Event("foo", canBubble:true, cancelable:false);
  Expect.isFalse(ev.cancelable, "cancelable (before)");
  ev.preventDefault();
  Expect.isFalse(ev.cancelable, "cancelable (after)");
  Expect.isFalse(ev.defaultPrevented, "defaultPrevented");
}
