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
          grid-template-rows: auto auto;
          grid-template-columns: auto auto;
          width: -webkit-fit-content;
      }

      .gridItem {
          width: 20px;
          height: 40px;
      }

      .marginTop {
          margin-top: 20px;
      }

      .marginBottom {
          margin-bottom: 20px;
      }

      .borderTop {
          border-top: 5px solid;
      }

      .borderBottom {
          border-bottom: 5px solid;
      }

      .paddingTop {
          padding-top: 10px;
      }

      .paddingBottom {
          padding-bottom: 10px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div>This test checks that the grid's rows and columns 'auto' sizes are updated accordingly to its grid-item's before and start margins.</div>

      <div>
          <div class="grid" data-expected-width="40" data-expected-height="120">
              <div class="gridItem marginTop firstRowFirstColumn"></div>
              <div class="gridItem firstRowSecondColumn"></div>
              <div class="gridItem marginBottom secondRowFirstColumn"></div>
              <div class="gridItem secondRowSecondColumn"></div>
          </div>
      </div>

      <div>
          <div class="grid" data-expected-width="40" data-expected-height="120">
              <div class="gridItem marginTop paddingTop firstRowFirstColumn"></div>
              <div class="gridItem firstRowSecondColumn"></div>
              <div class="gridItem borderTop borderBottom secondRowFirstColumn"></div>
              <div class="gridItem secondRowSecondColumn"></div>
          </div>
      </div>

      <div>
          <div class="grid" data-expected-width="40" data-expected-height="120">
              <div class="gridItem marginTop paddingTop firstRowFirstColumn"></div>
              <div class="gridItem firstRowSecondColumn"></div>
              <div class="gridItem borderTop borderBottom secondRowFirstColumn"></div>
              <div class="gridItem secondRowSecondColumn"></div>
          </div>
      </div>

      <div>
          <div class="grid" data-expected-width="40" data-expected-height="120">
              <div class="gridItem marginTop paddingTop firstRowFirstColumn"></div>
              <div class="gridItem firstRowSecondColumn"></div>
              <div class="gridItem paddingBottom secondRowFirstColumn"></div>
              <div class="gridItem secondRowSecondColumn"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
