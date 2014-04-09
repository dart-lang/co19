/**
 * after web-platform-tests/dom/events/Event-constructors.html
 */

import 'dart:html';
import "../../../../Utils/expect.dart";

void check(String t) {
  Event ev=new Event(t);
  Expect.equals(ev.type, t);
  Expect.equals(ev.target, null);
  Expect.equals(ev.currentTarget, null);
  Expect.equals(ev.eventPhase, 0);
//  Expect.equals(ev.bubbles, false); -- originally
  Expect.equals(ev.bubbles, true);
//  Expect.equals(ev.cancelable, false);-- originally
  Expect.equals(ev.cancelable, true);
  Expect.equals(ev.defaultPrevented, false);
  //Expect.equals(ev.isTrusted, false);
  Expect.isTrue(ev.timeStamp > 0);
}

void main() {
  check("");
  check("test");
}