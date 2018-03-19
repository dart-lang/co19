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

main() {
  var style = new Element.html('''
      <style>
        #test1 { padding: 10px; display: none; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="tests_container">
        
      <div id="test0" style="display: none"></div>
      <div id="test1"></div>
      <div id="test2" style="padding: 10px; display: none;"></div>
      <table id="test_table" cellpadding="10">
        <tr>
          <td id="test3" style="display: none">FOO</td>
          <td id="test4">BAR</td>
        <tr>
      </table>

      <div style="position: relative; width: 100px; height: 100px">
        <div id="test5" style="padding: 10%; width: 50px; height: 50px">BAR</div>
      </div>

      <div style="position: relative; width: 100px; height: 100px">
        <div id="test6" style="display: none; padding: 10%; width: 50px; height: 50px">BAR</div>
      </div>

      <div style="display: none; position: relative; width: 100px; height: 100px">
        <div id="test7" style="padding: 10%; width: 50px; height: 50px">BAR</div>
      </div>

      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var test0 = document.getElementById("test0");
  var test1 = document.getElementById("test1");
  var test2 = document.getElementById("test2");
  var test3 = document.getElementById("test3");
  var test4 = document.getElementById("test4");
  var test5 = document.getElementById("test5");
  var test6 = document.getElementById("test6");
  var test7 = document.getElementById("test7");

  shouldBeEqualToString(getComputedStyle(test0, null).paddingTop, "0px");
  shouldBeEqualToString(getComputedStyle(test1, null).paddingTop, "10px");
  shouldBeEqualToString(getComputedStyle(test2, null).paddingTop, "10px");
  if (!isIE) {
    shouldBeEqualToString(getComputedStyle(test3, null).paddingTop, "10px");
  }
  shouldBeEqualToString(getComputedStyle(test4, null).paddingTop, "10px");
  shouldBeEqualToString(getComputedStyle(test5, null).paddingTop, "10px");
  shouldBeEqualToString(getComputedStyle(test6, null).paddingTop, "10%");
  shouldBeEqualToString(getComputedStyle(test7, null).paddingTop, "10%");
}
