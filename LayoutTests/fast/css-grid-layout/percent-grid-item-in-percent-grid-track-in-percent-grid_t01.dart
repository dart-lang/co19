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
      .container {
          position: relative;
          width: 500px;
          height: 600px;
      }

      .grid {
          grid-template-columns: 40% 60%;
          grid-template-rows: 30% 70%;
          width: 80%;
          height: 50%;
      }

      .firstRowFirstColumn {
          width: 100%;
          height: 15px;
      }

      .firstRowSecondColumn {
          width: 15px;
          height: 100%;
      }

      .secondRowFirstColumn {
          width: 50%;
          height: 50%;
      }

      .secondRowSecondColumn {
          width: -webkit-calc(100%);
          height: -webkit-calc(100%);
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that percentage sized grid items inside percentage sized grid tracks inside a percentage size grid get properly sized.</p>

      <div class="container">
      <div class="grid" data-expected-width="400" data-expected-height="300">
          <div class="firstRowFirstColumn" data-expected-width="160" data-expected-height="15"></div>
          <div class="firstRowSecondColumn" data-expected-width="15" data-expected-height="90"></div>
          <div class="secondRowFirstColumn" data-expected-width="80" data-expected-height="105"></div>
          <div class="secondRowSecondColumn" data-expected-width="240" data-expected-height="210"></div>
      </div>
      </div>

      <div class="container">
      <div class="grid" style="-webkit-writing-mode: horizontal-bt" data-expected-width="400" data-expected-height="300">
          <div class="firstRowFirstColumn" data-expected-width="160" data-expected-height="15"></div>
          <div class="firstRowSecondColumn" data-expected-width="15" data-expected-height="90"></div>
          <div class="secondRowFirstColumn" data-expected-width="80" data-expected-height="105"></div>
          <div class="secondRowSecondColumn" data-expected-width="240" data-expected-height="210"></div>
      </div>
      </div>

      <div class="container">
      <div class="grid" style="-webkit-writing-mode: vertical-rl;" data-expected-width="400" data-expected-height="300">
          <div class="firstRowFirstColumn" data-expected-width="120" data-expected-height="15"></div>
          <div class="firstRowSecondColumn" data-expected-width="15" data-expected-height="180"></div>
          <div class="secondRowFirstColumn" data-expected-width="140" data-expected-height="60"></div>
          <div class="secondRowSecondColumn" data-expected-width="280" data-expected-height="180"></div>
      </div>
      </div>

      <div class="container">
      <div class="grid" style="-webkit-writing-mode: vertical-lr;" data-expected-width="400" data-expected-height="300">
          <div class="firstRowFirstColumn" data-expected-width="120" data-expected-height="15"></div>
          <div class="firstRowSecondColumn" data-expected-width="15" data-expected-height="180"></div>
          <div class="secondRowFirstColumn" data-expected-width="140" data-expected-height="60"></div>
          <div class="secondRowSecondColumn" data-expected-width="280" data-expected-height="180"></div>
      </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
