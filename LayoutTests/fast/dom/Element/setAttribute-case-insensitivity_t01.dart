/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p>Text for <a href="https://bugs.webkit.org/show_bug.cgi?id=10147">bug 10147</a>:
    REGRESSION: custom attribute values set via javascript are not persistent.</p>

    <table id="table1" border="0">
        <tr id="mg" customAttr="old Value">
        </tr>
    </table>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("mg").setAttribute("customAttr", "new value");

  Expect.equals("new value",
      document.getElementById("mg").getAttribute("customAttr"));
}
