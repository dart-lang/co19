/**
 * after web-platform-tests/dom/events/Event-defaultPrevented.html
 *
 * @description preventDefault() should change defaultPrevented if cancelable is false.
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  var ev = new Event("foo", canBubble:true, cancelable:true);
  Expect.isTrue(ev.cancelable, "cancelable (before)");
  ev.preventDefault();
  Expect.isTrue(ev.cancelable, "cancelable (after)");
  Expect.isTrue(ev.defaultPrevented, "defaultPrevented");
}
