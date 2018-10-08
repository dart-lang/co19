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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
          .testDiv
          {
              background-image: url($root/resources/map.jpg);
              width:500px;
              height:500px;
              border: 10px solid black;
          }
          
          .testDivNoRepeat
          {
              background-image: url($root/resources/map.jpg);
              background-repeat: no-repeat;
              width:500px;
              height:500px;
              border: 10px solid black;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="case1" class="testDiv" style="background-repeat:repeat-x">This div should have a horizontal repeating background (background-repeat:repeat-x)</div>
      <div id="case2" class="testDiv" style="background-repeat:repeat-y">This div should have a vertical repeating background (background-repeat:repeat-y)</div>
      <div id="case3" class="testDiv" style="background-repeat-y:no-repeat">This div should have a horizontal repeating background (background-repeat-y:no-repeat)</div>
      <div id="case4" class="testDiv" style="background-repeat-x:no-repeat">This div should have a vertical repeating background (background-repeat-x:no-repeat)</div>
      <div id="case5" class="testDiv" style="background-repeat-x:repeat; background-repeat-y:repeat">This div should have vertical and horizontal repeating background ()</div>
      <div id="case6" class="testDiv">This div should have vertical and horizontal repeating background (background-repeat-x:repeat; background-repeat-y:repeat)</div>
      <div id="case7" class="testDivNoRepeat" style="background-repeat-x:repeat">This div should have a horizontal repeating background (background-repeat: no-repeat; background-repeat-x:repeat)</div>
      <div id="case8" class="testDivNoRepeat" style="background-repeat-y:repeat">This div should have a vertical repeating background (background-repeat: no-repeat; background-repeat-y:repeat)</div>
      <div id="case9" class="testDivNoRepeat" style="background-repeat:repeat">This div should have a vertical and horizontal repeating background (background-repeat: repeat;)</div>
      <div id="case10" class="testDivNoRepeat" style="background-repeat-x:repeat; background-repeat-y:repeat">This div should have vertical and horizontal repeating background (background-repeat-x:repeat; background-repeat-y:repeat)</div>
      <div id="case11" class="testDivNoRepeat" style="">This div should have no repeating background ()</div>
      <div id="case12" class="testDivNoRepeat" style="background-repeat-x:no-repeat; background-repeat-y:no-repeat">This div should have no repeating background (background-repeat-x:no-repeat; background-repeat-y:no-repeat)</div>
      <div id="case13" class="testDivNoRepeat" style="background-repeat-x:repeat-y; background-repeat-y:repeat-x">This div should have no repeating background: invalid css (background-repeat-x:repeat-y; background-repeat-y:repeat-x)</div>
      <div id="case14" class="testDivNoRepeat" style="background-repeat-x:repeat-x; background-repeat-y:repeat-y">This div should have no repeating background: invalid css (background-repeat-x:repeat-x; background-repeat-y:repeat-y)</div>
      <div id="case15" class="testDivNoRepeat" style="background-repeat-x:10px;">This div should have no repeating background: invalid css (background-repeat-x:10px;)</div>
      <div id="case16" class="testDivNoRepeat" style="background-repeat:black;">This div should have no repeating background: invalid css (background-repeat:black;)</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var expectations = {
    "case1": "repeat-x",
    "case2": "repeat-y",
    "case3": "repeat-x",
    "case4": "repeat-y",
    "case5": "repeat",
    "case6": "repeat",
    "case7": "repeat-x",
    "case8": "repeat-y",
    "case9": "repeat",
    "case10": "repeat",
    "case11": "no-repeat",
    "case12": "no-repeat",
  };

  // Check element's style
  for (var caseId in expectations.keys) {
    debug(caseId);
    var testCase = document.getElementById(caseId);
    var style = testCase.getComputedStyle();
    var testData = expectations[caseId];
    var value = style.getPropertyValue("background-repeat");
    shouldBe(value, testData);
  }
}

