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
    <a href="http://localhost/sometestfile.html" id="anchor">
    A link!
    </a>
    ''', treeSanitizer: new NullTreeSanitizer());

  var anchor = document.getElementById("anchor");

  shouldBe(anchor.toString(), 'http://localhost/sometestfile.html');
}
