/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description https://bugs.webkit.org/show_bug.cgi?id=110698
 * Bug 110698: getPropertyValue for -webkit-column-rule returns null, should
 * compute the shorthand value
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
        .test {
          width: 100px;
          height: 100px;
          display: inline-block;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="-webkit-column-rule1" class="test" style="-webkit-column-rule: 10px solid black;"></div>
      <div id="-webkit-column-rule2" class="test" style="-webkit-column-rule: 10px solid;"></div>
      <div id="-webkit-column-rule3" class="test" style="-webkit-column-rule: 20px red;"></div>
      <div id="-webkit-column-rule4" class="test" style="-webkit-column-rule: 10px;"></div>
      <div id="-webkit-column-rule5" class="test" style="-webkit-column-rule: solid black;"></div>
      <div id="-webkit-column-rule6" class="test" style="-webkit-column-rule: dashed;"></div>
      <div id="-webkit-column-rule7" class="test" style="-webkit-column-rule: green;"></div>
      <div id="-webkit-column-rule8" class="test" style="-webkit-column-rule: foo;"></div>
      <div id="-webkit-column-rule9" class="test" style="-webkit-column-rule-style: dotted; -webkit-column-rule-width: 10px; -webkit-column-rule-color: black;"></div>
      <div id="-webkit-column-rule10" class="test" style="-webkit-column-rule-style: dashed; -webkit-column-rule-width: 10px;"></div>
      <div id="-webkit-column-rule11" class="test" style="-webkit-column-rule-style: dotted; -webkit-column-rule-color: black;"></div>
      <div id="-webkit-column-rule12" class="test" style="-webkit-column-rule-width: 10px;"></div>
      <p id="description"></p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var div1 = document.getElementById("-webkit-column-rule1");
  shouldBe(div1.style.getPropertyValue("-webkit-column-rule"), "10px solid black");

  var div2 = document.getElementById("-webkit-column-rule2");
  shouldBe(div2.style.getPropertyValue("-webkit-column-rule"), "10px solid");

  var div3 = document.getElementById("-webkit-column-rule3");
  shouldBe(div3.style.getPropertyValue("-webkit-column-rule"), "20px red");

  var div4 = document.getElementById("-webkit-column-rule4");
  shouldBe(div4.style.getPropertyValue("-webkit-column-rule"), "10px");

  var div5 = document.getElementById("-webkit-column-rule5");
  shouldBe(div5.style.getPropertyValue("-webkit-column-rule"), "solid black");

  var div6 = document.getElementById("-webkit-column-rule6");
  shouldBe(div6.style.getPropertyValue("-webkit-column-rule"), "dashed");

  var div7 = document.getElementById("-webkit-column-rule7");
  shouldBe(div7.style.getPropertyValue("-webkit-column-rule"), "green");

  var div8 = document.getElementById("-webkit-column-rule8");
  //shouldBe(div8.style.getPropertyValue("-webkit-column-rule"), null);
  shouldBe(div8.style.getPropertyValue("-webkit-column-rule"), '');
  debug("NOTE: 'foo' is an illegal CSS value for '-webkit-column-rule'.");

  var div9 = document.getElementById("-webkit-column-rule9");
  shouldBe(div9.style.getPropertyValue("-webkit-column-rule"), "10px dotted black");

  debug("NOTE: If only few longhand properties are specified, getPropertyValue for shorthand property returns null.");
  var div10 = document.getElementById("-webkit-column-rule10");
  //shouldBe(div10.style.getPropertyValue("-webkit-column-rule"), null);
  shouldBe(div10.style.getPropertyValue("-webkit-column-rule"), '');

  var div11 = document.getElementById("-webkit-column-rule11");
  //shouldBe(div11.style.getPropertyValue("-webkit-column-rule"), null);
  shouldBe(div11.style.getPropertyValue("-webkit-column-rule"), '');

  var div12 = document.getElementById("-webkit-column-rule12");
  //shouldBe(div12.style.getPropertyValue("-webkit-column-rule"), null);
  shouldBe(div12.style.getPropertyValue("-webkit-column-rule"), '');
}
