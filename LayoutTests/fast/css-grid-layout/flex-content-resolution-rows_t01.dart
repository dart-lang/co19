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
      .gridMinFlexContent {
          grid-template-columns: 50px;
          grid-template-rows: minmax(1fr, 50px);
      }
      .gridMaxFlexContent {
          grid-template-columns: 50px;
          grid-template-rows: minmax(30px, 2fr);
      }
      .gridTwoMaxFlexContent {
          grid-template-columns: 50px;
          grid-template-rows: minmax(10px, 1fr) minmax(10px, 2fr);
      }
      .gridTwoDoubleMaxFlexContent {
          grid-template-columns: 50px;
          grid-template-rows: minmax(10px, 0.5fr) minmax(10px, 2fr);
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that resolving auto tracks on grid items works properly.</p>

      <div style="height: 0px">
          <div class="grid gridMinFlexContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="0"></div>
          </div>
      </div>

      <div style="height: 0px">
          <div class="grid gridMinFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="50"></div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 10px; height: 40px">
          <div class="grid gridMinFlexContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
          </div>
      </div>

      <div style="width: 10px; height: 40px">
          <div class="grid gridMinFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="50"></div>
          </div>
      </div>

      <div style="width: 10px; height: 100px;">
          <div class="grid gridMinFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="50"></div>
          </div>
      </div>


      <div class="constrainedContainer">
          <div class="grid gridMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="30"></div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 10px; height: 40px">
          <div class="grid gridMaxFlexContent" style="height: 100%;">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
          </div>
      </div>

      <div style="width: 10px; height: 40px">
          <div class="grid gridMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="30"></div>
          </div>
      </div>

      <div style="width: 10px; height: 100px;">
          <div class="grid gridMaxFlexContent" style="height: 100%;">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="100"></div>
          </div>
      </div>

      <div style="width: 10px; height: 100px;">
          <div class="grid gridMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="30"></div>
          </div>
      </div>

      <div class="constrainedContainer">
          <div class="grid gridTwoMaxFlexContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
          </div>
      </div>

      <div class="constrainedContainer">
          <div class="grid gridTwoMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="20"></div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 10px; height: 60px">
          <div class="grid gridTwoMaxFlexContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="20"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
          </div>
      </div>

      <div style="width: 10px; height: 60px">
          <div class="grid gridTwoMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="20"></div>
          </div>
      </div>

      <div style="width: 10px; height: 120px;">
          <div class="grid gridTwoMaxFlexContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="80"></div>
          </div>
      </div>

      <div style="width: 10px; height: 120px;">
          <div class="grid gridTwoMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="20"></div>
          </div>
      </div>

      <div class="constrainedContainer">
          <div class="grid gridTwoDoubleMaxFlexContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
          </div>
      </div>

      <div class="constrainedContainer">
          <div class="grid gridTwoDoubleMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 10px; height: 60px">
          <div class="grid gridTwoDoubleMaxFlexContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="12"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="48"></div>
          </div>
      </div>

      <div style="width: 10px; height: 60px">
          <div class="grid gridTwoDoubleMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
          </div>
      </div>

      <div style="width: 10px; height: 120px;">
          <div class="grid gridTwoDoubleMaxFlexContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="24"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="96"></div>
          </div>
      </div>

      <div style="width: 10px; height: 120px;">
          <div class="grid gridTwoDoubleMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
