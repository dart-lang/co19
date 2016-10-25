/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Round-trip large values
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style type="text/css" media="screen">
        #box {
          position: absolute;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="box">
      ''', treeSanitizer: new NullTreeSanitizer());
    
  test(value) {
    debug('$value');
    var box = document.getElementById('box');

    var testValue = "${value}px";
    box.style.left = testValue;

    var leftValue = getComputedStyle(box, null).left;

    box.style.left = "0px";
    box.style.left = leftValue;
    var newLeftValue = getComputedStyle(box, null).left;

    shouldBe(newLeftValue, leftValue);
  }
  
  test(90010000);
  test(-33554430);
  test(-90010000);
}
