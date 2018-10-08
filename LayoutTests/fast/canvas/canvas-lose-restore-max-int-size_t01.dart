/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests to ensure correct behaviour of canvas loss and
 * restoration when size is extremely large then, restored to a reasonable
 * value.
 * @note no CanvasRenderingContext2D.isContextLost()
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var ctx, lostEventHasFired;

  verifyContextLost(shouldBeLost) {
    // Verify context loss experimentally as well as isContextLost()
    ctx.fillStyle = '#0f0';
    ctx.fillRect(0, 0, 1, 1);
    var contextLostTest = ctx.getImageData(0, 0, 1, 1).data[1] == 0;
    if (shouldBeLost) {
      shouldBeTrue(contextLostTest);
      //shouldBeTrue(ctx.isContextLost());
    } else {
      shouldBeFalse(contextLostTest);
      //shouldBeFalse(ctx.isContextLost());
    }
  }

  contextLost(_) {
    if (lostEventHasFired) {
      testFailed('Context lost event was dispatched more than once.');
    } else {
      testPassed('Graphics context lost event dispatched.');
    }
    lostEventHasFired = true;
    verifyContextLost(true);
  }

  contextRestored(_) {
    if (lostEventHasFired) {
      testPassed('Context restored event dispatched after context lost.');
    } else {
      testFailed('Context restored event was dispatched before a context lost event.');
    }
    verifyContextLost(false);
    asyncEnd();
  }

  dynamic canvas = document.createElement('canvas');
  canvas.addEventListener('contextlost', contextLost);
  canvas.addEventListener('contextrestored', contextRestored);
  ctx = canvas.getContext('2d');
  lostEventHasFired = false;
  verifyContextLost(false);

  // WebIDL defines width and height as int. 2147483647 is int max.
  var extremelyLargeNumber = 2147483647;
  canvas.width = extremelyLargeNumber;
  canvas.height = extremelyLargeNumber;
  verifyContextLost(true);
  canvas.width = extremelyLargeNumber;
  verifyContextLost(true);
  canvas.width = 100;
  canvas.height = 100;
  verifyContextLost(true); // Restoration is async.
  asyncStart();
}

