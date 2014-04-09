/**
 * after web-platform-tests/dom/events/Event-defaultPrevented.html
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  var ev = new Event("Event");
  Expect.isFalse(ev.defaultPrevented, "When an event is created, defaultPrevented should be initialized to false.");
}
