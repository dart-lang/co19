/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that the scroll event fires on elements asychronously
 * and only once.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setAttribute("style", "min-width: 5000px; min-height: 5000px");

  var eventCount = 0;

  window.onScroll.listen((event) {
    eventCount++;
    if (eventCount == 1) {
      debug('Scroll event bubbles');
      shouldBeTrue(event.bubbles);
      var scrollX = document.body.scrollLeft;
      var scrollY = document.body.scrollTop;
      debug('scrollX');
      shouldBe(scrollX, 200);
      debug('scrollY');
      shouldBe(scrollY, 200);
      // Don't call notifyDone straight away, in case there's another scroll event coming.
      setTimeout(asyncEnd, 100);
    } else {
      testFailed('Scroll handler was invoked $eventCount times');
      asyncEnd();
    }
  });

  asyncStart();

  window.scrollTo(100, 100);
  if (eventCount > 0) {
    testFailed('Scroll event fired synchronously');
    asyncEnd();
  }
  window.scrollTo(200, 200);
}
