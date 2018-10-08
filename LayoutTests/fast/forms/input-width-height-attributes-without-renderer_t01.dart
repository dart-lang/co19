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
      <input id="inputElement" type="image" width="50" height="50" style="display:none">
      ''', treeSanitizer: new NullTreeSanitizer());

  test(_) {
    InputElement inputElement = document.getElementById("inputElement") as InputElement;
    shouldBe(inputElement.width, 50);
    shouldBe(inputElement.height, 50);
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(test);
}
