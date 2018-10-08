/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Animations on :before and :after pseudo elements should run
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      @-webkit-keyframes example {
        from {
          width: 50px;
          height: 50px;
          top: 50px;
        }
        to {
          width: 10px;
          height: 10px;
          top: 200px;
        }
      }

      @keyframes example {
        from {
          width: 50px;
          height: 50px;
          top: 50px;
        }
        to {
          width: 10px;
          height: 10px;
          top: 200px;
        }
      }

      #after:after,
      #before:before {
          content: "";
          display: block;
          height: 50px;
          width: 50px;
          position: relative;
      }

      #after.animate:after,
      #before.animate:before {
          top: 200px;
          width: 10px;
          height: 10px;
          -webkit-animation: example 2s;
          -moz-animation: example 2s;
          animation: example 2s;
      }

      #before,
      #after {
          display: inline-block;
          border: 1px solid black;
          background: red;
      }

      #before.animate,
      #after.animate {
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

  // FIXME: This test should be modified so subpixel doesn't cause off by one
  // below and it no longer needs shouldBeCloseTo.

  testAnimation(id)
  {
    var div = document.getElementById(id);
    div.className = 'animate';
    shouldBe(div.offsetWidth, 52);
    // This will be flaky, but it's a reasonable approximation for testing
    // in a browser instead of DRT.
    setTimeout(() {
      shouldBeCloseTo(div.offsetWidth, 20, 1);
      var computedTop = getPseudoComputedTop(id);
      //shouldBeCloseTo(computedTop, 170, 1);
      shouldBeCloseTo(computedTop, 170, 2);
    }, 1000);
    setTimeout(() {
      shouldBeCloseTo(div.offsetWidth, 12, 1);
      var computedTop = getPseudoComputedTop(id);
      shouldBeCloseTo(computedTop, 200, 1);
      asyncEnd();
    }, 2000);
  }

  asyncMultiStart(2);
  window.onLoad.listen((_) {
    testAnimation('before');
    testAnimation('after');
  });
}
