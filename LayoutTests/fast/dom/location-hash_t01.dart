/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that modifying location.hash works as it should
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var state, originalLocation, originalHistoryLength;

  step(_) {
    state++;
    debug('state$state');
    switch (state) {
      case 1:
        shouldBe(window.history.length == originalHistoryLength, true);
        shouldBe(window.location.hash, '');
        window.location.hash = 'foo';
        shouldBe(window.location.hash, '#foo');
        shouldBe(window.location.href == originalLocation + '#foo', true);
        shouldBe(window.history.length ==  originalHistoryLength + 1, true);
        // hashchange will jump to the next step.
        break;
      case 2:
        window.location.hash = 'bar';
        shouldBe(window.location.hash, '#bar');
        shouldBe(window.location.href == originalLocation + '#bar', true);
        shouldBe(window.history.length == originalHistoryLength + 2, true);
        // hashchange will jump to the next step.
        break;
      case 3:
        window.location.hash = 'bar';
        shouldBe(window.location.hash, '#bar');
        shouldBe(window.location.href == originalLocation + '#bar', true);
        shouldBe(window.history.length == originalHistoryLength + 2, true);
        step(null); // No hashchange.
        break;
      case 4:
        shouldBe(window.location.hash, '#bar');
        shouldBe(window.location.href == originalLocation + '#bar', true);
        window.history.back();
        // history.back() is asychronous, location should be unchanged
        shouldBe(window.location.hash, '#bar');
        shouldBe(window.location.href == originalLocation + '#bar', true);
        // hashchange will jump to the next step.
        break;
      case 5:
        shouldBe(window.location.hash, '#foo');
        shouldBe(window.location.href == originalLocation + '#foo', true);
        window.history.back();
        // history.back() is asychronous, location should be unchanged
        shouldBe(window.location.hash, '#foo');
        shouldBe(window.location.href == originalLocation + '#foo', true);
        // hashchange will jump to the next step.
        break;
      case 6:
        shouldBe(window.location.hash, '');
        shouldBe(window.location.href == originalLocation, true);
        window.history.forward();
        // history.forward() is asychronous, location should be unchanged
        shouldBe(window.location.hash, '');
        shouldBe(window.location.href == originalLocation, true);
        // hashchange will jump to the next step.
        break;
      case 7:
        shouldBe(window.location.hash, '#foo');
        shouldBe(window.location.href == originalLocation + '#foo', true);
        window.location.hash = '';
        asyncEnd();
        return;
    }
  }

  state = 0;
  originalLocation = window.location.href;
  originalHistoryLength = window.history.length;

  window.onHashChange.listen(step);

  asyncStart();

  // Location changes need to happen outside the onload handler to generate history entries.
  setTimeout(() => step(null), 0);
}
