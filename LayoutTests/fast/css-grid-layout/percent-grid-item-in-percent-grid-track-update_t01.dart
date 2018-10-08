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
          grid-template-columns: 70% 30%;
          grid-template-rows: 40% 60%;
          width: 400px;
          height: 300px;
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
      <p>Test that changing percentage sized grid tracks make the grid items relayouts.</p>

      <div style="position: relative">
      <div class="grid" data-expected-width="400" data-expected-height="300">
          <div class="firstRowFirstColumn" data-expected-width="160" data-expected-height="15"></div>
          <div class="firstRowSecondColumn" data-expected-width="15" data-expected-height="120"></div>
          <div class="secondRowFirstColumn" data-expected-width="80" data-expected-height="90"></div>
          <div class="secondRowSecondColumn" data-expected-width="240" data-expected-height="180"></div>
      </div>
      </div>

      <div style="position: relative">
      <div class="grid" data-expected-width="400" data-expected-height="300">
          <div class="firstRowFirstColumn" data-expected-width="280" data-expected-height="15"></div>
          <div class="firstRowSecondColumn" data-expected-width="15" data-expected-height="90"></div>
          <div class="secondRowFirstColumn" data-expected-width="140" data-expected-height="105"></div>
          <div class="secondRowSecondColumn" data-expected-width="120" data-expected-height="210"></div>
      </div>
      </div>

      <div style="position: relative">
      <div class="grid" data-expected-width="400" data-expected-height="300">
          <div class="firstRowFirstColumn" data-expected-width="160" data-expected-height="15"></div>
          <div class="firstRowSecondColumn" data-expected-width="15" data-expected-height="90"></div>
          <div class="secondRowFirstColumn" data-expected-width="80" data-expected-height="105"></div>
          <div class="secondRowSecondColumn" data-expected-width="240" data-expected-height="210"></div>
      </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  changeGridDefinitionsAndCheckValues(_)
  {
    dynamic grid0 = document.getElementsByClassName("grid")[0];
    dynamic grid1 = document.getElementsByClassName("grid")[1];
    dynamic  grid2 = document.getElementsByClassName("grid")[2];
    document.body.offsetLeft;
    grid0.style.gridTemplateColumns = "40% 60%";

    grid1.style.gridTemplateRows = "30% 70%";

    grid2.style.gridTemplateColumns = "40% 60%";
    grid2.style.gridTemplateRows = "30% 70%";

    checkLayout('.grid');
    asyncEnd();
  }

  asyncStart();
  window.addEventListener("load", changeGridDefinitionsAndCheckValues, false);
}
