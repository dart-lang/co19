/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for getMatchedCssRules for Psuedo Elements
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style type="text/css" media="screen">
    #div1 {
        border: 2px;
    }
    #div1:after {
        border: 1px;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div id="div1"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var element = document.getElementById('div1');
  List pseudoRules = window.getMatchedCssRules(element, "after");
  var selectorText = "#div1::after";

  shouldBe(pseudoRules[0].selectorText, selectorText);
  shouldBeTrue(pseudoRules[0].style.cssText.indexOf("1px") != -1);
}
