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
import "../../resources/check-layout.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
      .grid {
          display: grid;
          grid-template-columns: 200px 200px;
          grid-template-rows: 200px 200px;
      }

      #absolutePos {
         position: absolute;
      }

      #fixedPos {
         position: fixed;
      }

      #floatPos {
         float: left;
      }

      #one {
          color: blue;
          background: red;
          grid-column: 1;
          grid-row: 1;
      }

      #two {
          color: yellow;
          background: green;
          grid-column: 2;
          grid-row: 1;
      }
      #three {
          color: gray;
          background: pink;
          grid-column: 1;
          grid-row: 2;
      }
      #four {
          color: orange;
          background: brown;
          grid-column: 2;
          grid-row: 2;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>This test checks that the shrink-to-fit behavior is applied to the float and out-of-flow positioned elements.</p>
      <p>The following grids should be 400px * 400px, except the first one which uses 'relative' positioning.</p>

      <div class="grid" id="regularGrid" data-expected-height="400" data-expected-width="769">
        <div id="one"></div>
        <div id="two"></div>
        <div id="three"></div>
        <div id="four"></div>
      </div>

      <div class="grid" id="absolutePos" data-expected-height="400" data-expected-width="400">
        <div class="gg" id="one"></div>
        <div class="gg" id="two"></div>
        <div class="gg" id="three"></div>
        <div class="gg" id="four"></div>
      </div>

      <div class="grid" id="fixedPos" data-expected-height="400" data-expected-width="400">
        <div class="gg" id="one"></div>
        <div class="gg" id="two"></div>
        <div class="gg" id="three"></div>
        <div class="gg" id="four"></div>
      </div>

      <div class="grid" id="floatPos" data-expected-height="400" data-expected-width="400">
        <div class="gg" id="one"></div>
        <div class="gg" id="two"></div>
        <div class="gg" id="three"></div>
        <div class="gg" id="four"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
