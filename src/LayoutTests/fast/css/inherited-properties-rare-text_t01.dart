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
      .a { -webkit-font-feature-settings: 'dlig'; -webkit-font-smoothing: antialiased; -webkit-text-orientation: upright; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class=a>
          <div id=test1></div>
      </div>
      <div id=test2></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(e, p) {
    var testDiv = document.getElementById(e);
    var cssValue = getComputedStyle(testDiv).getPropertyValue(p);
    return cssValue;
  }

  shouldBe(test('test1', '-webkit-font-feature-settings'), "'dlig' 1");
  shouldBe(test('test2', '-webkit-font-feature-settings'), "normal");
  shouldBe(test('test1', '-webkit-font-smoothing'), "antialiased");
  shouldBe(test('test2', '-webkit-font-smoothing'), "auto");
  shouldBe(test('test1', '-webkit-text-orientation'), "upright");
  shouldBe(test('test2', '-webkit-text-orientation'), "vertical-right");
}
