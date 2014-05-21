/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Siblings should only share if their host rules match
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html(''' 
    <style>
        #sandbox div {
            width: 50px;
            height: 50px;
        }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div id="sandbox">
        <div></div>
        <div></div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;
  var host = firstElementChild(document.getElementById("sandbox"));
  host.createShadowRoot().innerHtml =
    "<style>:host { background: red; }</style>";
  shouldBeEqualToString(host.getComputedStyle().backgroundColor,
    "rgb(255, 0, 0)");
}
