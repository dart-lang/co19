/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Should not share style if sibling has different styles in older
 * shadow roots
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
  var div1 = firstElementChild(document.getElementById("sandbox"));
  var div2 = lastElementChild(document.getElementById("sandbox"));

  div2.createShadowRoot();

  div1.createShadowRoot();
  div1.createShadowRoot().innerHtml =
    "<style>:host { background: red; }</style>";
  shouldBeEqualToString(div1.getComputedStyle().backgroundColor,
    "rgb(255, 0, 0)");
}