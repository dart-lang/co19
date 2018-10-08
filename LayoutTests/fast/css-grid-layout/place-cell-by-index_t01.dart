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
          grid-template-columns: 50px 60px;
          grid-template-rows: 20px 30px;
          max-width: 110px;
      }

      .firstRowFirstColumn {
          width: 10px;
          height: 15px;
      }

      .firstRowSecondColumn {
          width: 10px;
          height: 15px;
      }

      .secondRowFirstColumn {
          width: 10px;
          height: 15px;
      }

      .secondRowSecondColumn {
          width: 10px;
          height: 15px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test some simple grid layouts by positioning grid items by index.</p>

      <!-- FIXME: The offsets assumes that grid-{column|row}-align are set to 'start', not 'stretch' (the default). Fix
           them once we properly implement stretching / alignment. -->
      <div style="position: relative">
      <div class="grid" data-expected-width="110" data-expected-height="50">
          <div class="firstRowFirstColumn" data-offset-x="0" data-offset-y="0"></div>
          <div class="firstRowSecondColumn" data-offset-x="50" data-offset-y="0"></div>
          <div class="secondRowFirstColumn" data-offset-x="0" data-offset-y="20"></div>
          <div class="secondRowSecondColumn" data-offset-x="50" data-offset-y="20"></div>
      </div>
      </div>

      <div style="position: relative">
      <div class="grid" style="-webkit-writing-mode: horizontal-bt" data-expected-width="110" data-expected-height="50">
          <div class="firstRowFirstColumn" data-offset-x="0" data-offset-y="35"></div>
          <div class="firstRowSecondColumn" data-offset-x="50" data-offset-y="35"></div>
          <div class="secondRowFirstColumn" data-offset-x="0" data-offset-y="15"></div>
          <div class="secondRowSecondColumn" data-offset-x="50" data-offset-y="15"></div>
      </div>
      </div>

      <div style="position: relative">
      <div class="grid" style="-webkit-writing-mode: vertical-rl; margin-bottom: 60px;" data-expected-width="50" data-expected-height="110">
          <div class="firstRowFirstColumn" data-offset-x="40" data-offset-y="0"></div>
          <div class="firstRowSecondColumn" data-offset-x="40" data-offset-y="50"></div>
          <div class="secondRowFirstColumn" data-offset-x="20" data-offset-y="0"></div>
          <div class="secondRowSecondColumn" data-offset-x="20" data-offset-y="50"></div>
      </div>
      </div>

      <div style="position: relative">
      <div class="grid" style="-webkit-writing-mode: vertical-lr; margin-bottom: 60px;" data-expected-width="50" data-expected-height="110">
          <div class="firstRowFirstColumn" data-offset-x="0" data-offset-y="0"></div>
          <div class="firstRowSecondColumn" data-offset-x="0" data-offset-y="50"></div>
          <div class="secondRowFirstColumn" data-offset-x="20" data-offset-y="0"></div>
          <div class="secondRowSecondColumn" data-offset-x="20" data-offset-y="50"></div>
      </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
