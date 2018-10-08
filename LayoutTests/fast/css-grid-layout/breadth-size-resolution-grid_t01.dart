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
          grid-template-columns: 100px 10vw;
          grid-template-rows: 10vh 100px;
      }

      .firstRowFirstColumn {
          width: 100%;
          height: 100%;
      }

      .firstRowSecondColumn {
          width: 100%;
          height: 100%;
      }

      .secondRowFirstColumn {
          width: 100%;
          height: 100%;
      }

      .secondRowSecondColumn {
          width: 100%;
          height: 100%;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that specifying the track breadth sizes works properly with all the allowed length types and in different writing modes.</p>

      <div class="grid">
          <div class="firstRowFirstColumn" data-expected-width="100" data-expected-height="60"></div>
          <div class="firstRowSecondColumn" data-expected-width="80" data-expected-height="60"></div>
          <div class="secondRowFirstColumn" data-expected-width="100" data-expected-height="100"></div>
          <div class="secondRowSecondColumn" data-expected-width="80" data-expected-height="100"></div>
      </div>

      <div class="grid verticalRL">
          <div class="firstRowFirstColumn" data-expected-width="60" data-expected-height="100"></div>
          <div class="firstRowSecondColumn" data-expected-width="60" data-expected-height="80"></div>
          <div class="secondRowFirstColumn" data-expected-width="100" data-expected-height="100"></div>
          <div class="secondRowSecondColumn" data-expected-width="100" data-expected-height="80"></div>
      </div>

      <div class="grid">
           <div class="firstRowFirstColumn" class="verticalRL" data-expected-width="100" data-expected-height="60"></div>
           <div class="firstRowSecondColumn" data-expected-width="80" data-expected-height="60"></div>
           <div class="secondRowFirstColumn" class="verticalRL" data-expected-width="100" data-expected-height="100"></div>
           <div class="secondRowSecondColumn" data-expected-width="80" data-expected-height="100"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
