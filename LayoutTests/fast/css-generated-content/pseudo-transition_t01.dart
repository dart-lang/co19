/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Transitions on :before and :after pseudo elements should run
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      #before:before,
      #after:after {
          content: "";
          display: block;
          height: 50px;
          width: 50px;
          top: 50px;
          position: relative;
          -webkit-transition: width 2s, top 2s;
          -moz-transition: width 2s, top 2s;
          transition: width 2s, top 2s;
      }

      #before.transition:before,
      #after.transition:after {
          top: 200px;
          height: 10px;
          width: 10px;
      }

      #before,
      #after {
          display: inline-block;
          border: 1px solid black;
          background: red;
      }

      #after.transition,
      #before.transition {
          background: green;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="before"></div>
      <div id="after"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  parseFloat(s) => double.parse(s.substring(0, s.length-2)); // trim trailing 'px'

  getPseudoComputedTop(id) {
    return round(parseFloat(getComputedStyle(document.getElementById(id), ':' + id).top));
  }

  testTransition(id)
  {
    var div = document.getElementById(id);
    div.className = 'transition';
    shouldBe(div.offsetWidth, 52);
    // This will be flaky, but it's a reasonable approximation for testing
    // in a browser instead of DRT.
    setTimeout(() {
      shouldBeCloseTo(div.offsetWidth, 20, 1);
      var computedTop = getPseudoComputedTop(id);
      shouldBeCloseTo(computedTop, 170, 1);
    }, 1000);
    setTimeout(() {
      shouldBeCloseTo(div.offsetWidth, 12, 1);
      var computedTop = getPseudoComputedTop(id);
      shouldBeCloseTo(computedTop, 200, 1);
      asyncEnd();
    }, 2000);
  }

  asyncMultiStart(2);

  testTransition('before');
  testTransition('after');
}
