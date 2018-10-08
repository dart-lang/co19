/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that we can listen for scroll events on the document in
 * both the capture and bubble phases.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      ''', treeSanitizer: new NullTreeSanitizer());
  document.body.setAttribute("style", "min-height: 2000px");

  var triggeredCaptureListener = false;
  var triggeredBubbleListener = false;

  checkComplete()
  {
    if (triggeredCaptureListener && triggeredBubbleListener) {
      debug('Both capture and bubble phase listeners were invoked.');
      asyncEnd();
    }
  }
  window.addEventListener(
      'scroll',
      (event) {
        triggeredCaptureListener = true;
        checkComplete();
      },
      true);

  window.addEventListener(
      'scroll',
      (event) {
        triggeredBubbleListener = true;
        checkComplete();
      },
      false);


  asyncStart();
  window.scrollTo(200, 200);
}
