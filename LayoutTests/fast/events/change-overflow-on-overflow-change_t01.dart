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
      <div id="result"></div>
      <div style="position: relative; height: 200px; overflow: auto;">
          <div id="target" style="height: 75%; background-color: red;"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var callCount = 0;
  var recursionDepth = 0;

  var target = document.getElementById("target");
  var result = document.getElementById("result");

  pass()
  {
    result.innerHtml = "PASS";
    asyncEnd();
  }

  fail()
  {
    result.innerHtml = "FAIL";
    asyncEnd();
  }

  toggleOverflow(_)
  {
    ++recursionDepth;
    ++callCount;

    // The code change associated with this test will cause this function to start 
    // firing asynchronously.
    if (recursionDepth > 2) {
      fail();
      return;
    }

    // If we have made it this far without a recursionDepth of 2 or greater, then we 
    // can say that the test passed.
    if (callCount > 8) {
      pass();
      return;
    }

    if (target.style.height == "75%")
      target.style.height = "200%";
    else
      target.style.height = "75%";
    target.offsetHeight;

    --recursionDepth;
  }

  window.onLoad.listen((_) {
    // Force a layout with offsetHeight, and then start toggling overflow.
    target.offsetHeight;
    toggleOverflow(null);
  });

  asyncStart();

  target.parentNode.addEventListener("overflowchanged", toggleOverflow);
}
