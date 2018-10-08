/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div tabindex="0" id="target">div</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  DivElement target = document.getElementById('target');
  target.focus();
  shouldBe(document.activeElement, target);
  debug('Remove tabindex.');
  window.onLoad.listen((_) {
    target.addEventListener('blur', (_) {
      testPassed('blur event was disaptched.');
      target.remove();
      asyncEnd();
    }, false);
    // Need to wait until CheckFocusedElementTask is unqueued.
    setTimeout(() {
      target.attributes.remove('tabindex');
    }, 10);
    setTimeout(() {
      testFailed('No blur event');
      asyncEnd();
    }, 1000);
  });
}
