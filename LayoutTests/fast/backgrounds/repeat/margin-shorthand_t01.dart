/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This layouttest was initially there to test that shorthand
 * property value is correct even if background-repeat property is declared
 * before it in the style declaration. It used to test regression described in
 * this bug. Now that access to non author stylesheet is blocked, we should
 * instead get null when accessing the css rules on that object.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var link = new Element.html('''
      <link rel="stylesheet" href="$root/resources/margin-shorthand.css">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(link);

  document.body.setInnerHtml('''
      <div id="icon"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  iconMarginValue()
  {
    var iconDiv = document.getElementById('icon');
    dynamic rules = window.getMatchedCssRules(iconDiv,'');
    return rules[1] != null ? rules[1].style.getPropertyValue('margin') : 'null';
  }

  //shouldBe(iconMarginValue(), "null");
}

