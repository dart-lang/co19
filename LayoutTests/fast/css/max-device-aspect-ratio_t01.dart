/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This text is green if the max-device-aspect-ratio media query
 * works properly.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var count = 0;
  var maxCount = 10;
  var timeout = 1000;

  waitForStylesheetLoad()
  {
    count++;

    if (getComputedStyle(document.getElementById('description'), null).color == "rgb(0, 128, 0)") {
      //shouldBe(getComputedStyle(document.getElementById('description'), null).color, 'rgb(0, 128, 0)');
      asyncEnd();
      return;
    }

    if (count > maxCount) {
      testFailed("Stylesheet did not load in ${(maxCount * timeout / 1000)} second(s).");
      return;
    }

    setTimeout(waitForStylesheetLoad(), timeout);
  }

  doTest()
  {
    var headElement = document.head;
    dynamic linkElement = document.createElement("link");
    linkElement.rel = "stylesheet";
    var width;
    var height;
    if (window.screen.width > window.screen.height) {
      // For a landscape screen, a ratio of 100/1 should always be greater than the screen (e.g., 16/9)
      width = 100;
      height = 1;
    } else {
      // For a portrait screen, a ratio of 1/1 will always be greater than the screen (e.g., 9/16)
      // For a square screen, a ratio of 1/1 will always be equal to the screen (e.g., 9/9)
      width = 1;
      height = 1;
    }
    linkElement.media = "screen and (max-device-aspect-ratio: $width/$height)";
    linkElement.href = "$root/resources/device-aspect-ratio.css";
    headElement.append(linkElement);
    description("This text is green if the max-device-aspect-ratio media query works properly.");
    setTimeout(waitForStylesheetLoad, timeout);
  }

  asyncStart();
  doTest();

}
