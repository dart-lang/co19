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
  document.body.setInnerHtml('''
      <div id="container" style="overflow: auto; width: 500px; height: 500px">
        <div style="height: 5000px; width: 5000px;"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var eventCount = 0;

  scrollHandler(event)
  {
    eventCount++;
    if (eventCount == 1) {
      //debug('Scroll event bubbles: ${event.bubbles}');
      debug('Scroll event bubbles');
      shouldBeFalse(event.bubbles);
      var container = document.getElementById('container');
      var scrollX = container.scrollLeft;
      var scrollY = container.scrollTop;
      //testPassed('Scroll position: ($scrollX, $scrollY)');
      debug('scrollX');
      shouldBe(scrollX, 0);
      debug('scrollY');
      shouldBe(scrollY, 200);
      // Don't call notifyDone straight away, in case there's another scroll event coming.
      setTimeout(asyncEnd, 100);
    } else {
      testFailed('Scroll handler was invoked $eventCount times');
      asyncEnd();
    }
  }

  asyncStart();

  var container = document.getElementById('container');
  container.addEventListener('scroll', scrollHandler, false);
  container.scrollTop = 100;
  if (eventCount > 0) {
    testFailed('Scroll event fired synchronously');
    asyncEnd();
  }
  container.scrollTop = 200;
}
