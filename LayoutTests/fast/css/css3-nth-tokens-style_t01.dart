/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test passes if the nth-of-type can accept a parameter that
 * is an+b, odd or even. But it does not accept any other parameter.
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var style = new Element.html('''
      <style>
      span.c1:nth-of-type(2n + 1){ color: red; }
      span.c1:nth-of-type(2n - 2){ color: green; }
      span.c2:nth-of-type(odd){ color: red; }
      span.c2:nth-of-type(even){ color: green; }
      span.c3:nth-of-type(n3){ color: red; }
      span.c3:nth-of-type(foo){ color: green; }
      span.c4:nth-of-type(2n3){ color: red; }
      span.c4:nth-of-type(foon + bar ){ color: green; }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      debug("These spans should alternate red and green");
      <div id="test1"></div>
      debug("These spans should alternate red and green");
      <div id="test2"></div>
      debug("These spans should be black");
      <div id="test3"></div>
      debug("These spans should be black");
      <div id="test4"></div>
      <br>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var i=1;
  for(; i < 5; i++) {
    var str = "";
    var j=1;
    for (; j < 9; j++) {
      str += '<span class="c$i" id="span${i + j}"> span </span>';
    }
    document.getElementById("test$i").innerHtml = str;
  }

  var el = document.getElementById("span11");
  shouldBe(getComputedStyle(el).getPropertyValue('color'), 'rgb(255, 0, 0)');

  el = document.getElementById("span12");
  shouldBe(getComputedStyle(el).getPropertyValue('color'), 'rgb(0, 128, 0)');

  el = document.getElementById("span21");
  shouldBe(getComputedStyle(el).getPropertyValue('color'), 'rgb(255, 0, 0)');

  el = document.getElementById("span22");
  shouldBe(getComputedStyle(el).getPropertyValue('color'), 'rgb(0, 128, 0)');

  el = document.getElementById("span31");
  shouldBe(getComputedStyle(el).getPropertyValue('color'), 'rgb(0, 0, 0)');

  el = document.getElementById("span32");
  shouldBe(getComputedStyle(el).getPropertyValue('color'), 'rgb(0, 0, 0)');

  el = document.getElementById("span41");
  shouldBe(getComputedStyle(el).getPropertyValue('color'), 'rgb(0, 0, 0)');

  el = document.getElementById("span42");
  shouldBe(getComputedStyle(el).getPropertyValue('color'), 'rgb(0, 0, 0)');
}
