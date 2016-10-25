/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Testing whether box-sizing works with and withou the
 * -webkit-prefix (bug 36713).
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <div id="test-prefixed-sizing" style="-webkit-box-sizing: border-box;"></div>
      <div id="test-prefixless-sizing" style="box-sizing: border-box;"></div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var prefixStyle = document.getElementById('test-prefixed-sizing').style;
  shouldBeEqualToString(prefixStyle.getPropertyValue('box-sizing'), "border-box");
  shouldBeEqualToString(prefixStyle.getPropertyValue('-webkit-box-sizing'), "border-box");
  shouldBeEqualToString(prefixStyle.boxSizing, "border-box");
  //shouldBeEqualToString(prefixStyle.WebkitBoxSizing, "border-box");
  //shouldBeEqualToString(prefixStyle.webkitBoxSizing, "border-box");

  var prefixLessStyle = document.getElementById('test-prefixless-sizing').style;
  shouldBeEqualToString(prefixLessStyle.getPropertyValue('box-sizing'), "border-box");
  shouldBeEqualToString(prefixLessStyle.getPropertyValue('-webkit-box-sizing'), "border-box");
  shouldBeEqualToString(prefixLessStyle.boxSizing, "border-box");
  //shouldBeEqualToString(prefixLessStyle.WebkitBoxSizing, "border-box");
  //shouldBeEqualToString(prefixLessStyle.webkitBoxSizing, "border-box");
}
