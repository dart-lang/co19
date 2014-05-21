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
    <a id="x" href="http://www.google.com"><b>the second copy should not be bold</b></a>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById("x").text,
      'the second copy should not be bold');
}
