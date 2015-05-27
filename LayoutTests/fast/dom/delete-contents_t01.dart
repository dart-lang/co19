/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test was derived from a real case inside the Mail
 * application, bug 4598149
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="mydiv">01234</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var txt = document.getElementById("mydiv").firstChild;
  window.getSelection().setBaseAndExtent(txt, 0, txt, 5);
  var r = window.getSelection().getRangeAt(0);
  r.deleteContents();
  r.insertNode(document.createElement("div"));
}
