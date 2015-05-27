/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      #test1 { -webkit-background-composite: highlight; }
      #test2 { -webkit-background-composite: invalid; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      Tests that highlight is treated the same as an invalid value for a composite operation:<br>
      <div id="result"></div>
      <span id="test1"></span>
      <span id="test2"></span>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var value1 = document.getElementById('test1').getComputedStyle()
    .getPropertyValue('-webkit-background-composite');
  var value2 = document.getElementById('test2').getComputedStyle()
    .getPropertyValue('-webkit-background-composite');
  shouldBe(value1, value2);
}
