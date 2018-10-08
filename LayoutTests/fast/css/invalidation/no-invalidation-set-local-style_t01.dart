/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Class selectors in rightmost compound selector should cause
 * LocalStyleChange even if we cannot use invalidation sets.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
        #t1 div + .test { background-color: green }
        #t2 div ~ .test { background-color: green }
        #t3 :not(.nomatch) .test { background-color: green }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="t1">
          <div></div>
          <div>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
          </div>
      </div>
      <div id="t2">
          <div></div>
          <span></span>
          <div>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
          </div>
      </div>
      <div id="t3">
          <div>
              <div>
                  <span></span>
                  <span></span>
                  <span></span>
                  <span></span>
              </div>
          </div>
      </div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var tests = [
    [ "#t1 > div + div", 1 ],
    [ "#t2 > div ~ div", 1 ],
    [ "#t3 > div > div", 1 ]
  ];

  var green = 'rgb(0, 128, 0)';

  for (var i=0; i<tests.length; i++) {
    var test = tests[i];
    var elm = document.querySelector(test[0]);
    document.body.offsetLeft;
    elm.className = "test";
    shouldBe(getComputedStyle(elm, null).backgroundColor, green);
  }
}

