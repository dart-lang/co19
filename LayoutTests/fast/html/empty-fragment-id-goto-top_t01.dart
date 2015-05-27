/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
    When clicking the link "Goto Top" at the middle of the page, it should go here.
    <div style="height:1500px; width:500px; background:#ffddff"></div>
    <a id="gotoTop" name="gotoTop" href="#">Goto Top</a>
    <div style="height:3000px; width:500px; background:#ffffdd"></div>
    <a name="youshouldnotfindme">Oops! Here is the bottom of the page.</a>
    <a id="" name="youshouldnotfindmeeither">Oops!</a>
    <a name="">Oops!</a>
    ''', treeSanitizer: new NullTreeSanitizer());

  window.scrollTo(0, 1000);

  var clickEvent = new Event('click', canBubble: true, cancelable: true);

  var gotoTop = document.getElementById("gotoTop");
  gotoTop.dispatchEvent(clickEvent);

  Expect.equals(0, document.body.scrollTop);
}
