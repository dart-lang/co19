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
        grid-template-columns: 100px 300px;
        grid-template-rows: 50px 150px;
        height: 200px;
        width: 400px;
    }

    .calcWidth {
        width: -webkit-calc(80% + 20%);
        height: 15px;
    }

    .calcHeight {
        width: 15px;
        height: -webkit-calc(80% + 20px);
    }

    .calcHeightAndWidth {
        width: -webkit-calc(80% + 20px);
        height: -webkit-calc(70% + 30%);
    }
    </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that resolving calc lengths on grid items works properly on a fixed grid with different writing modes.</p>

      <div class="grid">
          <div class="firstRowFirstColumn calcWidth" data-expected-width="100" data-expected-height="15"></div>
          <div class="firstRowSecondColumn calcHeight" data-expected-width="15" data-expected-height="60"></div>
          <div class="secondRowFirstColumn calcHeightAndWidth" data-expected-width="100" data-expected-height="150"></div>
          <div class="secondRowSecondColumn calcHeightAndWidth" data-expected-width="260" data-expected-height="150"></div>
      </div>

      <div class="grid verticalRL">
          <div class="firstRowFirstColumn calcWidth" data-expected-width="50" data-expected-height="15"></div>
          <div class="firstRowSecondColumn calcHeight" data-expected-width="15" data-expected-height="260"></div>
          <div class="secondRowFirstColumn calcHeightAndWidth" data-expected-width="140" data-expected-height="100"></div>
          <div class="secondRowSecondColumn calcHeightAndWidth" data-expected-width="140" data-expected-height="300"></div>
      </div>

      <div class="grid">
          <div class="firstRowFirstColumn calcWidth verticalRL" data-expected-width="100" data-expected-height="15"></div>
          <div class="firstRowSecondColumn calcHeight verticalRL" data-expected-width="15" data-expected-height="60"></div>
          <div class="secondRowFirstColumn calcHeightAndWidth verticalRL" data-expected-width="100" data-expected-height="150"></div>
          <div class="secondRowSecondColumn calcHeightAndWidth verticalRL" data-expected-width="260" data-expected-height="150"></div>
      </div>

      <div class="grid">
          <div class="firstRowFirstColumn calcWidth verticalRL" data-expected-width="100" data-expected-height="15"></div>
          <div class="firstRowSecondColumn calcHeight" data-expected-width="15" data-expected-height="60"></div>
          <div class="secondRowFirstColumn calcHeightAndWidth verticalRL" data-expected-width="100" data-expected-height="150"></div>
          <div class="secondRowSecondColumn calcHeightAndWidth" data-expected-width="260" data-expected-height="150"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
