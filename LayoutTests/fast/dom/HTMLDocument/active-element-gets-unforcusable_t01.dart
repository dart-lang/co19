/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Making a focused element invisible should make it blur.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="f1">
      <div tabindex="1" id="div1"></div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var focusTarget = document.getElementById('div1');
  var testStage = 0;

  focusTarget.focus();

  shouldBe(document.activeElement, focusTarget, true);

  focusTarget.addEventListener('blur', (_) {
    debug('Event: blur');
    shouldBe(document.activeElement, document.body);
    testPassed('The focusTarget element lost focus.');

    debug('');
    if (testStage++ == 0) {
      var f1 = document.getElementById('f1');
      f1.style.display = 'block';
      focusTarget.focus();
      shouldBe(document.activeElement, focusTarget, true);
      debug('===> Setting visibility:hidden');
      f1.style.visibility = 'hidden';
    }
    asyncEnd();
  }, false);

  debug('===> Setting display:none');
  var f1 = document.getElementById('f1');

  asyncStart();
  f1.style.display = 'none';
}
