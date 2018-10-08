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
          padding: 10px;
          border-top: 10px dotted blue;
          border-right: 20px dotted blue;
          border-bottom: 30px dotted blue;
          border-left: 40px dotted blue;
          grid-template-rows: 100px 100px;
          grid-template-columns: 100px 100px;
          width: 200px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div>This test checks that the grid items are shifted by the grid container's paddings and borders before / start.</div>

      <div style="position: relative">
          <div class="grid" data-expected-width="280" data-expected-height="260">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="50" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-offset-x="150" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-offset-x="50" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowSecondColumn" data-offset-x="150" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid verticalRL" data-expected-width="280" data-expected-height="260">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="150" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-offset-x="150" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-offset-x="50" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowSecondColumn" data-offset-x="50" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid verticalLR" data-expected-width="280" data-expected-height="260">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="50" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-offset-x="50" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-offset-x="150" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowSecondColumn" data-offset-x="150" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid horizontalBT" data-expected-width="280" data-expected-height="260">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="50" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-offset-x="150" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-offset-x="50" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowSecondColumn" data-offset-x="150" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
          </div>
      </div>

      <!-- rtl direciton -->
      <div style="position: relative">
          <div class="grid directionRTL" data-expected-width="280" data-expected-height="260">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="30" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-offset-x="130" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-offset-x="30" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowSecondColumn" data-offset-x="130" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid verticalRL directionRTL" data-expected-width="280" data-expected-height="260">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="150" data-offset-y="40" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-offset-x="150" data-offset-y="140" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-offset-x="50" data-offset-y="40" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowSecondColumn" data-offset-x="50" data-offset-y="140" data-expected-width="100" data-expected-height="100"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid verticalLR directionRTL" data-expected-width="280" data-expected-height="260">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="50" data-offset-y="40" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-offset-x="50" data-offset-y="140" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-offset-x="150" data-offset-y="40" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowSecondColumn" data-offset-x="150" data-offset-y="140" data-expected-width="100" data-expected-height="100"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid horizontalBT directionRTL" data-expected-width="280" data-expected-height="260">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="30" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-offset-x="130" data-offset-y="120" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-offset-x="30" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowSecondColumn" data-offset-x="130" data-offset-y="20" data-expected-width="100" data-expected-height="100"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
