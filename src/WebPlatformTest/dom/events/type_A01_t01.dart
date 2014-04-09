/**
 * after web-platform-tests/dom/events/Event-type.html
 *
 * @description check Event constructors
 * @needsreview issue #18026: Event.eventType() not supported:
 * Exception: NotSupportedError: The implementation did not support the requested type of object or operation.
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  Event ev=new Event.eventType("foo", "bar");
  Expect.equals("foo", ev.type, "constructor Event.eventType");
  ev=new Event.eventType("foo", "bar", canBubble:false, cancelable:false);
  Expect.equals("foo", ev.type, "constructor Event.eventType with named arguments");
}
