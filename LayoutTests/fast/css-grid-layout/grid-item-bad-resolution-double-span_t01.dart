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
          grid-template-rows: (firstRow) 10px 20px;
          grid-template-columns: (firstColumn) 30px 40px;
          grid-auto-flow: row;
      }

      .bothSpanRow {
          grid-column: 1;
          grid-row: span 5 (firstRow) / span 1;
      }

      .bothSpanColumn {
          grid-column: span / span 3;
          grid-row: 1;
      }

      .spanAutoRow {
          grid-column: 1;
          grid-row: span 5 (firstRow) / auto;
      }

      .spanAutoColumn {
          grid-column: span / auto;
          grid-row: 1;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>This test checks that we resolve 2 opposite 'span' / 'auto' positions by applying the auto-placement algorithm.</p>

      <div style="position: relative">
          <div class="grid">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="30" data-expected-height="10"></div>
              <div class="sizedToGridArea bothSpanRow" data-offset-x="0" data-offset-y="10" data-expected-width="30" data-expected-height="20"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="30" data-expected-height="10"></div>
              <div class="sizedToGridArea bothSpanColumn" data-offset-x="30" data-offset-y="0" data-expected-width="40" data-expected-height="10"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="30" data-expected-height="10"></div>
              <div class="sizedToGridArea spanAutoRow" data-offset-x="0" data-offset-y="10" data-expected-width="30" data-expected-height="20"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="30" data-expected-height="10"></div>
              <div class="sizedToGridArea spanAutoColumn" data-offset-x="30" data-offset-y="0" data-expected-width="40" data-expected-height="10"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
