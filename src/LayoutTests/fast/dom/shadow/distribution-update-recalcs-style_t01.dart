/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests to ensure that updating the select rule in projection
 * causes style recalc.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <pre id="console"></div>
    <div id="test">
        <div id="host" style="color: red">
            <div id="div-child"></div>
            <span id="span-child"></span>
        </div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  getColorProperty(id) {
    return document.getElementById(id).getComputedStyle().color;
  }

  log(message) {
    var console = document.getElementById('console');
    console.innerHtml += message + '\n';
  }

  var sr = document.getElementById("host").createShadowRoot();
  sr.innerHtml = '<style>div { color: blue }</style><div><content id="contentId" select="#div-child"></content></div>';

  shouldBe(getColorProperty("div-child"), "rgb(0, 0, 255)");
  shouldBe(getColorProperty("span-child"), "rgb(255, 0, 0)");

  sr.getElementById("contentId").select = "#span-child";
  shouldBe(getColorProperty("div-child"), "rgb(255, 0, 0)");
  shouldBe(getColorProperty("span-child"), "rgb(0, 0, 255)");
}
