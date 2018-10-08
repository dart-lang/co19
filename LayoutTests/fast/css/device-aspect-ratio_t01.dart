/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This text is green if the device-aspect-ratio media query works
 * properly.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  document.head.id = "myhead";

  var count = 0;
  var maxCount = 10;
  var timeout = 100;

  waitForStylesheetLoad()
  {
    count++;

    if (getComputedStyle(document.getElementById('description')).color == "rgb(0, 128, 0)") {
      asyncEnd();
      return;
    }

    if (count > maxCount) {
      testFailed("Stylesheet did not load in ${(maxCount * timeout / 1000)} second(s).");
      return;
    }

    setTimeout(waitForStylesheetLoad, timeout);
  }

  doTest()
  {
    dynamic headElement = document.getElementById("myhead");
    dynamic linkElement = document.createElement("link");
    linkElement.rel = "stylesheet";
    linkElement.media = "screen and (device-aspect-ratio: ${window.screen.width}/${window.screen.height}";
    linkElement.href = "$root/resources/device-aspect-ratio.css";
    headElement.append(linkElement);
    description("This text is green if the device-aspect-ratio media query works properly.");
    setTimeout(waitForStylesheetLoad, timeout);
  }

  asyncStart();
  doTest();
}
