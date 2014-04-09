/**
 * after web-platform-tests/dom/events/Event-propagation.html
 *
 * @description
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void testPropagationFlag(Event ev, bool expected, String desc) {
   var called = false;
   var callback = (ev) { called = true; };
   document.head.addEventListener("foo", callback);
   document.head.dispatchEvent(ev);
   Expect.equals(called, expected, desc);
   document.head.removeEventListener("foo", callback);
}

void main() {
  var ev = new Event("foo", canBubble:true, cancelable:false);
  testPropagationFlag(ev, true, "Newly-created Event");

  ev.stopPropagation();
  testPropagationFlag(ev, false, "After stopPropagation()");

  ev = new Event("foo", canBubble:true, cancelable:false);
  testPropagationFlag(ev, true, "Reinitialized after stopPropagation()");

  ev = new Event("foo", canBubble:true, cancelable:false);
  ev.stopImmediatePropagation();
  testPropagationFlag(ev, false, "After stopImmediatePropagation()");

  ev = new Event("foo", canBubble:true, cancelable:false);
  testPropagationFlag(ev, true, "Reinitialized after stopImmediatePropagation()");
}
