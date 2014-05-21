/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests to ensure that styles of distributed nodes are different
 * if their parent styles are different.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <pre id="console"></div>
    <div id="test">
        <div id="host" style="color: red">
            <div id="child-a"></div>
            <div id="child-b"></div>
        </div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());
  
  getColorProperty(id) {
    return document.getElementById(id).getComputedStyle().color;
  }

  var sr = document.getElementById("host").createShadowRoot();
  sr.innerHtml = '<content select="#child-a"></content><div style="color: blue"><content select="#child-b"></content></div>';

  shouldBe(getColorProperty("child-a"), "rgb(255, 0, 0)");
  shouldBe(getColorProperty("child-b"), "rgb(0, 0, 255)");

  document.getElementById("test").innerHtml = '';
}
