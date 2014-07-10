/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that background-color is non-inherit and currentColor is
 * handled correctly
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

getComputedStyle(x) => x.getComputedStyle();

main() {
  var style = new Element.html('''
      <style>
      #test3 { color: blue; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="test-container">
        <div id="test1" style="color:green; background: currentColor"></div>
        <div id="test2" style="color:red; background: currentColor"></div>
        <div style="color:green">
          <div id="test3" style="color:currentColor; background: currentColor"></div>
        </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var test1 = document.getElementById("test1");
  var test2 = document.getElementById("test2");
  var test3 = document.getElementById("test3");
  test2.style.color = "green";
  shouldBeEqualToString(getComputedStyle(test1).backgroundColor, 'rgb(0, 128, 0)');
  shouldBeEqualToString(getComputedStyle(test2).backgroundColor, 'rgb(0, 128, 0)');
  shouldBeEqualToString(getComputedStyle(test3).backgroundColor, 'rgb(0, 128, 0)');
}
