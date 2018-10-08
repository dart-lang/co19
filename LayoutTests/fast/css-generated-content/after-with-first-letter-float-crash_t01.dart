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
      <style type="text/css">
          div::first-letter { float: right; content: "AB" }
          div::after { display: table; content: "CD" }
      </style>
      <div></div>
      PASS, if the script does not cause a crash or ASSERT failure
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;
  document.body.style.color = "blue";
}
