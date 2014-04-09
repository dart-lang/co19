/**
 * after web-platform-tests/dom/events/Event-constants.html
 */

import 'dart:html';
import "../../../../Utils/expect.dart";

void main() {
//  Expect.equals(Event.NONE, 0);
  Expect.throws(()=>Event.NONE);
  Expect.equals(Event.CAPTURING_PHASE, 1);
  Expect.equals(Event.AT_TARGET, 2);
  Expect.equals(Event.BUBBLING_PHASE, 3);
}