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
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <style>
      .grid {
          width: 100px;
          height: 200px;
      }

      #grid1 {
          grid-template-columns: 30px;
          grid-template-rows: minmax(20px, 80px) 160px;
      }

      #grid2 {
          grid-template-columns: 30px;
          grid-template-rows: minmax(50%, 120px) minmax(20px, 40%);
      }

      #grid3 {
          grid-template-columns: 30px;
          /* Overlapping range. */
          grid-template-rows: minmax(10px, 180px) minmax(30px, 150px);
      }

      #grid4 {
          grid-template-columns: 30px;
          grid-template-rows: minmax(20px, 80px) 60px;
          -webkit-writing-mode: vertical-rl;
      }

      #grid5 {
          grid-template-columns: 30px;
          /* 90% > 80px, 80px should be ignored. */
          grid-template-rows: minmax(90%, 80px) minmax(10px, 60%);
          -webkit-writing-mode: vertical-lr;
      }

      #grid6 {
          /* Overlapping range. */
          grid-template-columns: 30px;
          grid-template-rows: minmax(10px, 180px) minmax(30px, 150px);
          -webkit-writing-mode: horizontal-bt;
      }

      .firstRowFirstColumn {
          width: 100%;
          height: 100%;
      }

      .secondRowFirstColumn {
          width: 100%;
          height: 100%;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p><a href="https://webkit.org/b/104700">Bug 104700<a>: [CSS Grid Layout] Implement grid items sizing for fixed minmax grid tracks</p>
      <p>Checks that a grid element with fixed minmax properly compute the logical height in several writing-mode.</p>

      <div class="grid" id="grid1" data-expected-width="100" data-expected-height="200">
          <div class="firstRowFirstColumn" data-expected-height="40" data-expected-width="30"></div>
          <div class="secondRowFirstColumn" data-expected-height="160" data-expected-width="30"></div>
      </div>

      <div class="grid" id="grid2" data-expected-width="100" data-expected-height="200">
          <div class="firstRowFirstColumn" data-expected-height="120" data-expected-width="30"></div>
          <div class="secondRowFirstColumn" data-expected-height="80" data-expected-width="30"></div>
      </div>

      <div class="grid" id="grid3" data-expected-width="100" data-expected-height="200">
          <div class="firstRowFirstColumn" data-expected-height="90" data-expected-width="30"></div>
          <div class="secondRowFirstColumn" data-expected-height="110" data-expected-width="30"></div>
      </div>

      <div class="grid" id="grid4" data-expected-width="100" data-expected-height="200">
          <div class="firstRowFirstColumn" data-expected-height="30" data-expected-width="40"></div>
          <div class="secondRowFirstColumn" data-expected-height="30" data-expected-width="60"></div>
      </div>

      <div class="grid" id="grid5" data-expected-width="100" data-expected-height="200">
          <div class="firstRowFirstColumn" data-expected-height="30" data-expected-width="90"></div>
          <div class="secondRowFirstColumn" data-expected-height="30" data-expected-width="10"></div>
      </div>

      <div class="grid" id="grid6" data-expected-width="100" data-expected-height="200">
          <div class="firstRowFirstColumn" data-expected-height="90" data-expected-width="30"></div>
          <div class="secondRowFirstColumn" data-expected-height="110" data-expected-width="30"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
