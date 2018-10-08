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
    <img id="x" src="IntentionallyMissingFile.gif">
    This text should only appear once.
    ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();

  window.onLoad.listen((_) {
    shouldBe(document.getElementById("x").text, '');
    asyncEnd();
  });
}
