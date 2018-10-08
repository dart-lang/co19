/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that we fire two Load events on a page with two
 * HTML Style elements and that both events are fired before the Load event
 * for the window is dispatched.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var numberOfFiredLoadEvents = 0;
  var expectedNumberOfFiredLoadEvents = 2;

  EventListener checkIfDone(elementName) => (_) {
    ++numberOfFiredLoadEvents;

    if (numberOfFiredLoadEvents < expectedNumberOfFiredLoadEvents
        && elementName == 'body') {
      testFailed('Fired window Load event before style Load events');
    }
    if (numberOfFiredLoadEvents == expectedNumberOfFiredLoadEvents) {
      asyncEnd();
    }
  };

  var style1 = new StyleElement();
  style1.onLoad.listen(checkIfDone('style1'));
  var style2 = new StyleElement();
  style2.onLoad.listen(checkIfDone('style2'));
  document.head.append(style1);
  document.head.append(style2);

  window.onLoad.listen(checkIfDone('body'));
  asyncStart();
}
