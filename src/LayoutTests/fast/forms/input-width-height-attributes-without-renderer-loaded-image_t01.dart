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
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <input type="image" id="imageElement" src="$root/resources/green.jpg">
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  document.onReadyStateChange.listen((_) {
    var readyState = document.readyState;
    if (readyState == 'complete') {
      var e = document.getElementById("imageElement");
      e.setAttribute("style", "display:none");
      shouldBe(e.width, 16);
      shouldBe(e.height, 16);
      asyncEnd();
    }
  });
}
