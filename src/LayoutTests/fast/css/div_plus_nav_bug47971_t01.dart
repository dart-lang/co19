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

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
      #one + nav { color: green; }
      #two+nav { color: green; }
      #three +nav { color: green; }
      #four+ nav { color: green; }
      label+nav { color: green; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Testing label+nav selector. The test passes if all NAVs are green.</p>

      <div id="one"></div>
      <nav id="nav1">NAV1</nav>

      <div id="two"></div>
      <nav id="nav2">NAV2</nav>

      <div id="three"></div>
      <nav id="nav3">NAV4</nav>

      <div id="four"></div>
      <nav id="nav4">NAV5</nav>

      <label></label>
      <nav id="nav5">NAV6</nav>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest(element)
  {
    var greenValues = [
      "rgb(0, 128, 0)", // WebKit, Firefox 4, IE9
      "#008000" // Opera 11.11
    ];

    var elem = document.getElementById(element);
    var val = getComputedStyle(elem).getPropertyValue("color");

    if (greenValues.indexOf(val.toLowerCase()) != -1)
      testPassed("Pass: " + element);
    else
      testFailed("Fail: " + element + " actual color is " + val);
  }

  runTest("nav1");
  runTest("nav2");
  runTest("nav3");
  runTest("nav4");
  runTest("nav5");
}
