/**
 * after web-platform-tests/dom/events/Event-constructors.html
 */

import 'dart:html';
import "../../../../Utils/expect.dart";

void check(String t, bool canBubble, bool cancelable) {
  Event ev=new Event(t, canBubble: canBubble, cancelable: cancelable);
  Expect.equals(ev.bubbles, canBubble);
  Expect.equals(ev.cancelable, cancelable);
}

void main() {
  check("ff", false, false);
  check("ft", false, true);
  check("tf", true, false);
  check("tt", true, true);
}