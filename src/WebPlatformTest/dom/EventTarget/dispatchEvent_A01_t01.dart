/**
 * after web-platform-tests/dom/events/EventTarget-dispatchEvent.html
 *
 * @description If the event's dispatch flag is set, an InvalidStateError must be thrown
 */

import 'dart:html';
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  var ev = new Event("type", canBubble:false, cancelable:false);

  var target = document.createElement("div");
  target.addEventListener("type", (e) {
    asyncEnd();
    Expect.throws(() {
      target.dispatchEvent(e);
    }, (e)=>e is DomException, "target");
    Expect.throws(() {
      document.dispatchEvent(e);
    }, (e)=>e is DomException, "document");
  });

  asyncStart();
  Expect.isTrue(target.dispatchEvent(ev), "dispatchEvent must return true");
}
