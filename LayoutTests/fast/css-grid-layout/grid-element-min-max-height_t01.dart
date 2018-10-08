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
      .minHeightGrid {
          min-height: 100px;
          grid-template-columns: 40px;
          grid-template-rows: 50px;
      }
      .maxHeightGrid {
          max-height: 100px;
          grid-template-columns: 40px;
          grid-template-rows: 150px 50px;
      }

      .minHeightAutoGrid {
          min-height: 100px;
      }

      .maxHeightAutoGrid {
          max-height: 100px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that min-height and max-height are accounted for when computing the grid element's height.</p>

      <div class="constrainedContainer">
          <div class="grid minHeightGrid" data-expected-height="100" data-expected-width="10"></div>
          <div class="grid maxHeightGrid" data-expected-height="100" data-expected-width="10"></div>
          <div class="grid minHeightAutoGrid" data-expected-height="100" data-expected-width="10"></div>
          <div class="grid maxHeightAutoGrid" data-expected-height="0" data-expected-width="10"></div>

          <div class="grid minHeightAutoGrid" data-expected-height="150" data-expected-width="10">
              <div style="height: 150px"></div>
          </div>
          <div class="grid maxHeightAutoGrid" data-expected-height="100" data-expected-width="10">
              <div style="height: 300px"></div>
          </div>
      </div>

      <div class="unconstrainedContainer">
          <div class="grid minHeightGrid" data-expected-height="100" data-expected-width="1000"></div>
          <div class="grid maxHeightGrid" data-expected-height="100" data-expected-width="1000"></div>
          <div class="grid minHeightAutoGrid" data-expected-height="100" data-expected-width="1000"></div>
          <div class="grid maxHeightAutoGrid" data-expected-height="0" data-expected-width="1000"></div>

          <div class="grid minHeightAutoGrid" data-expected-height="150" data-expected-width="1000">
              <div style="height: 150px"></div>
          </div>
          <div class="grid maxHeightAutoGrid" data-expected-height="100" data-expected-width="1000">
              <div style="height: 300px"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
