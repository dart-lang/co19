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
      .gridAutoContent {
          grid-template-columns: 50px;
          grid-template-rows: auto;
      }

      .firstRowFirstColumn {
          font: 10px/1 Ahem;
          /* Make us fit our grid area. */
          width: 100%;
          height: 100%;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that resolving auto tracks on grid items works properly.</p>

      <div class="constrainedContainer">
          <div class="grid gridAutoContent">
              <div class="firstRowFirstColumn" data-expected-width="50" data-expected-height="30">XXXXX XXXXX XXXXX</div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 40px; height: 10px">
          <div class="grid gridAutoContent">
              <div class="firstRowFirstColumn" data-expected-width="50" data-expected-height="30">XXXXX XXXXX XXXXX</div>
          </div>
      </div>

      <div style="width: 40px; height: 10px;">
          <div class="grid gridAutoContent">
              <div class="firstRowFirstColumn" data-expected-width="50" data-expected-height="60">XXXXX XXXXX XXXXX XXXXX XXXXX XXXXX</div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.gridAutoContent');
    asyncEnd();
  });
}
