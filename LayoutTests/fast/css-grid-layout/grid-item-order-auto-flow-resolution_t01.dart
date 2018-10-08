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
          grid-template-columns: 50px 100px;
          grid-template-rows: 50px 100px;
      }

      .negativeOrder {
          order: -1;
      }

      .positiveOrder {
          order: 10;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>This test checks that the auto-placement algorithm takes 'order' into account when placing grid items.</p>

      <!-- Step 1, grid item with a major-axis position that is not 'auto'. -->
      <div style="position: relative">
          <div class="grid gridAutoFlowRow">
              <div class="sizedToGridArea firstRowAutoColumn" data-offset-x="50" data-offset-y="0" data-expected-width="100" data-expected-height="50"></div>
              <div class="sizedToGridArea firstRowAutoColumn negativeOrder" data-offset-x="0" data-offset-y="0" data-expected-width="50" data-expected-height="50"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid gridAutoFlowRow">
              <div class="sizedToGridArea firstRowAutoColumn positiveOrder" data-offset-x="50" data-offset-y="0" data-expected-width="100" data-expected-height="50"></div>
              <div class="sizedToGridArea firstRowAutoColumn" data-offset-x="0" data-offset-y="0" data-expected-width="50" data-expected-height="50"></div>
          </div>
      </div>

      <!-- Step 4.1, grid items with a minor-axis position that is not 'auto'. -->
      <div style="position: relative">
          <div class="grid gridAutoFlowColumn">
              <div class="sizedToGridArea secondRowAutoColumn" data-offset-x="50" data-offset-y="50" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowAutoColumn negativeOrder" data-offset-x="0" data-offset-y="50" data-expected-width="50" data-expected-height="100"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid gridAutoFlowColumn">
              <div class="sizedToGridArea secondRowAutoColumn positiveOrder" data-offset-x="50" data-offset-y="50" data-expected-width="100" data-expected-height="100"></div>
              <div class="sizedToGridArea secondRowAutoColumn" data-offset-x="0" data-offset-y="50" data-expected-width="50" data-expected-height="100"></div>
          </div>
      </div>

      <!-- Step 4.2, both minor and major-axis position are 'auto'. -->
      <div style="position: relative">
          <div class="grid gridAutoFlowColumn">
              <div class="sizedToGridArea" data-offset-x="0" data-offset-y="50" data-expected-width="50" data-expected-height="100"></div>
              <div class="sizedToGridArea negativeOrder" data-offset-x="0" data-offset-y="0" data-expected-width="50" data-expected-height="50"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid gridAutoFlowColumn">
              <div class="sizedToGridArea positiveOrder" data-offset-x="0" data-offset-y="50" data-expected-width="50" data-expected-height="100"></div>
              <div class="sizedToGridArea" data-offset-x="0" data-offset-y="0" data-expected-width="50" data-expected-height="50"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
