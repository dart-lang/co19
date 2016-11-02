/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for WebKit bug 78595: CollectingRules and QueryingRules 
 * modes of SelectorChecker miss some complex selectors with pseudo elements
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style type="text/css">
      .parent.secondParent .firstChild:before {
          color: brown;
          content: "brown";
      }

      .topParent.topmost .parent.secondParent .secondChild:before {
          color: cyan;
          content: "cyan";
      }

      .parent.secondParent > .thirdChild:before {
          color: red;
          content: "red";
      }

      .topParent.topmost > .parent.secondParent > .fourthChild:before {
          color: magenta;
          content: "magenta";
      }

      .parent.predecessor + .parent.firstParent:before {
          color: green;
          content: "green";
      }

      .parent.firstParent ~ .secondParent:before {
          color: lime;
          content: "lime";
      }

      .parent.firstParent + .parent.secondParent + .thirdParent:before {
          color: blue;
          content: "blue";
      }

      .parent.predecessor ~ .parent.secondParent ~ .fourthParent:before {
          color: crimson;
          content: "crimson";
      }

      .pass {
          color: green;
      }

      .fail {
          color: red;
      }

    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <h3>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=24021">WebKit bug 78595</a>: CollectingRules and QueryingRules modes of SelectorChecker miss some complex selectors with pseudo elements</h3>
    <br />
    <div class="topParent topmost">
      <div class="parent predecessor"></div>
      <div class="parent firstParent" id="firstParent"></div>
      <div class="parent secondParent" id="secondParent">
        <div class="firstChild" id="firstChild"></div>
        <div class="secondChild" id="secondChild"></div>
        <div class="thirdChild" id="thirdChild"></div>
        <div class="fourthChild" id="fourthChild"></div>
      </div>
      <div class="parent thirdParent" id="thirdParent"></div>
      <div class="parent fourthParent" id="fourthParent"></div>
    </div>
    <br />
    ''', treeSanitizer: new NullTreeSanitizer());

  var tests = [
  { 'elementId' : 'firstChild', 'expectedValue' : 'rgb(165, 42, 42)' },
  { 'elementId' : 'secondChild', 'expectedValue' : 'rgb(0, 255, 255)' },
  { 'elementId' : 'thirdChild', 'expectedValue' : 'red' },
  { 'elementId' : 'fourthChild', 'expectedValue' : 'rgb(255, 0, 255)' },
  { 'elementId' : 'firstParent', 'expectedValue' : 'green' },
  { 'elementId' : 'secondParent', 'expectedValue' : 'lime' },
  { 'elementId' : 'thirdParent', 'expectedValue' : 'blue' },
  { 'elementId' : 'fourthParent', 'expectedValue' : 'rgb(220, 20, 60)' },
  ];

  tests.forEach((curTest) {
    document.createElement('div');
    var element = document.querySelector("#" + curTest['elementId']);

    var mainMessage;
    var matchedRules;
    if (element == null)
      mainMessage = "Element with id #" + curTest['elementId'] + " not found";
    else {
      matchedRules = window.getMatchedCssRules(element, "before");
      if (matchedRules == null || matchedRules.length != 1)
        mainMessage = " Matching rules for #" + curTest['elementId'] +
          ":before do not contain a single rule";
    }
    if (mainMessage != null)
      testFailed(mainMessage);

    var value = matchedRules[0].style.color;
    mainMessage = " Expected '" + curTest['expectedValue'] +
      "' for color in the matched CSS rule for element with id " +
      curTest['elementId'] + " and pseudo-element :before";
    debug(mainMessage);
    shouldBe(value, curTest['expectedValue']);
  });
}
