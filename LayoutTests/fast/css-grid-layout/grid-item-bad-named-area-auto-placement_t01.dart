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
          grid-template-rows: 10px 20px;
          grid-template-columns: 30px 40px;
          grid-auto-flow: row;
      }

      .bothNamedGridLineRow {
          grid-row: nonExistentArea / nonExistentArea;
          grid-column: 1;
      }

      .bothNamedGridLineColumn {
          grid-row: 1;
          grid-column: nonExistentArea / span 3;
      }

      .namedGridLineSpanRow {
          grid-row: nonExistentArea / span 5 "firstRow";
          grid-column: 1;
      }

      .namedGridLineSpanColumn {
          grid-row: 1;
          grid-column: nonExistentArea / span;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>This test checks that unknown named area are treated as 'auto' by applying the auto-placement algorithm when mandated.</p>

      <div style="position: relative">
          <div class="grid">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="30" data-expected-height="10"></div>
              <div class="sizedToGridArea bothNamedGridLineRow" data-offset-x="0" data-offset-y="10" data-expected-width="30" data-expected-height="20"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="30" data-expected-height="10"></div>
              <div class="sizedToGridArea bothNamedGridLineColumn" data-offset-x="30" data-offset-y="0" data-expected-width="40" data-expected-height="10"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="30" data-expected-height="10"></div>
              <div class="sizedToGridArea namedGridLineSpanRow" data-offset-x="0" data-offset-y="10" data-expected-width="30" data-expected-height="20"></div>
          </div>
      </div>

      <div style="position: relative">
          <div class="grid">
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="30" data-expected-height="10"></div>
              <div class="sizedToGridArea namedGridLineSpanColumn" data-offset-x="30" data-offset-y="0" data-expected-width="40" data-expected-height="10"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
