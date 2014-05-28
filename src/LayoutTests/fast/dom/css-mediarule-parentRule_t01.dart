/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that calling parentRule on the child rule of
 * MediaRule is equal to that MediaRule.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var head = document.getElementsByTagName('head')[0];
  var style = new Element.html('''
      <style>@media all { a { border-color: red; } }</style>
    ''', treeSanitizer: new NullTreeSanitizer());
  head.append(style);

  var styleSheetList = document.styleSheets;
  var styleSheet = styleSheetList[styleSheetList.length-1];
  var mediaRule = styleSheet.cssRules[0];
  var childRule = mediaRule.cssRules[0];

  shouldBe(childRule.parentRule, mediaRule);
}

