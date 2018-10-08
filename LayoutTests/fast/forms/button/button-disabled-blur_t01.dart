/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <style>
      button:disabled {
          color: #aaa;
      }
      button {
          -webkit-appearance: none;
      }
      </style>
      <button>Button</button>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  ButtonElement button = document.body.querySelector('button') as ButtonElement;
  button.onClick.listen((_) {
    button.disabled = true;
  });

  button.focus();
  shouldBe(document.activeElement, button);
  debug('Clicking a button makes the button disabled.');
  asyncStart();
  window.onLoad.listen((_) {
    button.addEventListener('blur', (_) {
      testPassed('blur event was disaptched.');
      button.remove();
      asyncEnd();
    }, false);
    // Need to wait until CheckFocusedElementTask is unqueued.
    setTimeout(() {
      button.click();
      document.body.offsetTop;
    }, 20);
    setTimeout(() {
      testFailed('No blur event.');
      asyncEnd();
    }, 2000);
  });
}
