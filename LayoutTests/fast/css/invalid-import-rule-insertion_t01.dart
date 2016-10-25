/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description HIERARCHY_REQUEST_ERR raised if @import rule inserted after a
 * regular rule
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic style = new Element.html('''
      <style type="text/css">
          body {color: Blue; }
          div {color: Red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>This text should be red and the page should have no other style.</div>
      <div id="testresult">FAIL</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  try
  {
    style.sheet.insertRule("@import url(testStyle1.css);", 1);
  }
  catch(e)
  {
    if (getComputedStyle(document.body, "").getPropertyValue("background-color") == "rgba(0, 0, 0, 0)"
        && style.sheet.cssRules.length == 2)
    {
      document.getElementById("testresult").innerHtml = "PASS";
    }
  }
}
