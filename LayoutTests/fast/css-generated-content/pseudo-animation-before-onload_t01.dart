/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Animations on :before and :after pseudo elements should run
 * when applied before onload.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      @-webkit-keyframes example {
        from { width: 50px; height: 50px; }
        to { width: 10px; height: 10px; }
      }

      @keyframes example {
        from { width: 50px; height: 50px; }
        to { width: 10px; height: 10px; }
      }

      .after:after,
      .before:before {
          content: "";
          display: block;
          position: relative;
          background: green;
          width: 10px;
          height: 10px;
          -webkit-animation: example 2s;
          -moz-animation: example 2s;
          animation: example 2s;
      }

      .before,
      .after {
          display: inline-block;
          border: 1px solid black;
          background: red;
      }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class="before"></div>
      <div class="before" id="before"></div>
      <div class="before"></div>
      <div class="after"></div>
      <div class="after" id="after"></div>
      <div class="after"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  testAnimations(_)
  {
    // This will be flaky, but it's a reasonable approximation for testing
    // in a browser instead of DRT.
    setTimeout(() {
      var div = document.getElementById('before');
      shouldBeCloseTo(div.offsetWidth, 20, 1);
      div = document.getElementById('after');
      shouldBeCloseTo(div.offsetWidth, 20, 1);
    }, 1000);
    setTimeout(() {
      var div = document.getElementById('before');
      shouldBeCloseTo(div.offsetWidth, 12, 1);
      div = document.getElementById('after');
      shouldBeCloseTo(div.offsetWidth, 12, 1);
      asyncEnd();
    }, 2000);
  }

  asyncStart();
  window.onLoad.listen(testAnimations);
}
