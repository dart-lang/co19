/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This succeeds if max-height and max-width are not set together,
 * but are different values.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  doTest()
  {
    description("This succeeds if max-height and max-width are not set together, but are different values.");

    var box = document.createElement("div");
    box.style.setProperty('max-height', "20px");
    box.style.setProperty('max-width', "30px");

    document.body.append(box);

    var style = getComputedStyle(box);
    if(style.getPropertyValue("max-height") == style.getPropertyValue("max-width"))
      testFailed("max-width is NOT independent of max-height.");
    else
      testPassed("max-width is independent of max-height.");
  }

  doTest();
}
