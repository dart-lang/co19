/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that we fire two Load events on a page with two 
 * HTML Link elements and that both events are fired before the Load event 
 * for the window is dispatched.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var numberOfFiredLoadEvents = 0;
  var expectedNumberOfFiredLoadEvents = 2;

  EventListener checkIfDone(elementName) => (_) {
    ++numberOfFiredLoadEvents;

    if (numberOfFiredLoadEvents < expectedNumberOfFiredLoadEvents 
        && elementName == 'body') {
      testFailed("FAIL Fired window Load event before link Load events.");
    }
    if (numberOfFiredLoadEvents == expectedNumberOfFiredLoadEvents) {
      asyncEnd();
    }
  };

  document.head.append(new Element.html(
    '<link id="lnk1" rel="stylesheet" href="$root/resources/stylesheet.css">',
    treeSanitizer: new NullTreeSanitizer()));
  document.head.append(new Element.html(
    '<link id="lnk2" rel="stylesheet" href="$root/resources/stylesheet.css">',
    treeSanitizer: new NullTreeSanitizer()));

  var lnk1 = document.getElementById('lnk1');
  var lnk2 = document.getElementById('lnk2');

  asyncStart();

  lnk1.onLoad.listen(checkIfDone('link1'));
  lnk2.onLoad.listen(checkIfDone('link2'));
  window.onLoad.listen(checkIfDone('body'));
}
