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
          grid-template-columns: 100px 100px;
          grid-template-rows: 200px 200px;
          width: -webkit-fit-content;
      }

      .cell {
          width: 10px;
          height: 20px;
      }

      .justifySelfStretch {
          justify-self: stretch;
      }

      .justifySelfStart {
          justify-self: start;
      }

      .justifySelfEnd {
          justify-self: end;
      }

      .justifySelfCenter {
          justify-self: center;
      }

      .justifySelfRight {
          justify-self: right;
      }

      .justifySelfLeft {
          justify-self: left;
      }

      .justifySelfFlexStart {
          justify-self: flex-start;
      }

      .justifySelfFlexEnd {
          justify-self: flex-end;
      }

      .justifySelfSelfStart {
          justify-self: self-start;
      }

      .justifySelfSelfEnd {
          justify-self: self-end;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>This test checks that the justify-self property is applied correctly.</p>

      <div style="position: relative" class="constrainedContainer">
      <div class="grid" data-expected-width="200" data-expected-height="400">
          <div class="justifySelfStretch firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="100" data-expected-height="0"></div>
          <div class="cell justifySelfStart firstRowSecondColumn" data-offset-x="100" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfEnd firstRowSecondColumn" data-offset-x="190" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfCenter secondRowFirstColumn" data-offset-x="45" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfRight secondRowSecondColumn" data-offset-x="190" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfLeft secondRowSecondColumn" data-offset-x="100" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
      </div>

      <div style="position: relative" class="constrainedContainer">
      <div class="grid" data-expected-width="200" data-expected-height="400">
          <div class="cell justifySelfFlexEnd firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfFlexStart firstRowSecondColumn" data-offset-x="100" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfSelfStart secondRowFirstColumn" data-offset-x="0" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfSelfEnd secondRowSecondColumn" data-offset-x="190" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
      </div>
      </div>

      <!-- Vertical writing mode. -->
      <div style="position: relative" class="constrainedContainer">
      <div class="grid verticalRL" data-expected-width="400" data-expected-height="200">
          <!-- FIXME: Why is offset-x 400? -->
          <div class="justifySelfStretch firstRowFirstColumn" data-offset-x="400" data-offset-y="0" data-expected-width="0" data-expected-height="100"></div>
          <div class="cell justifySelfStart firstRowSecondColumn" data-offset-x="390" data-offset-y="100" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfEnd firstRowSecondColumn" data-offset-x="390" data-offset-y="180" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfCenter secondRowFirstColumn" data-offset-x="190" data-offset-y="40" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfRight secondRowSecondColumn" data-offset-x="190" data-offset-y="100" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfLeft secondRowSecondColumn" data-offset-x="190" data-offset-y="100" data-expected-width="10" data-expected-height="20"></div>
      </div>

      <div style="position: relative" class="constrainedContainer">
      <div class="grid verticalLR" data-expected-width="400" data-expected-height="200">
          <div class="cell justifySelfFlexEnd firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfFlexStart firstRowSecondColumn" data-offset-x="0" data-offset-y="100" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfSelfStart secondRowFirstColumn" data-offset-x="200" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfSelfEnd secondRowSecondColumn" data-offset-x="200" data-offset-y="180" data-expected-width="10" data-expected-height="20"></div>
      </div>
      </div>

      <!-- RTL direction. -->
      <div style="position: relative" class="constrainedContainer">
      <div class="grid directionRTL" data-expected-width="200" data-expected-height="400">
          <div class="justifySelfStretch firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="100" data-expected-height="0"></div>
          <div class="cell justifySelfStart firstRowSecondColumn" data-offset-x="190" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfEnd firstRowSecondColumn" data-offset-x="100" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfCenter secondRowFirstColumn" data-offset-x="45" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfRight secondRowSecondColumn" data-offset-x="190" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfLeft secondRowSecondColumn" data-offset-x="100" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
      </div>

      <div style="position: relative" class="constrainedContainer">
      <div class="grid directionRTL" data-expected-width="200" data-expected-height="400">
          <div class="cell justifySelfFlexEnd firstRowFirstColumn" data-offset-x="90" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfFlexStart firstRowSecondColumn" data-offset-x="190" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfSelfStart secondRowFirstColumn" data-offset-x="90" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfSelfEnd secondRowSecondColumn" data-offset-x="100" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
      </div>
      </div>

      <!-- RTL direction with opposite directions grid container vs grid item. -->
      <div style="position: relative" class="constrainedContainer">
      <div class="grid" data-expected-width="200" data-expected-height="400">
          <div class="justifySelfStretch firstRowFirstColumn directionRTL" data-offset-x="0" data-offset-y="0" data-expected-width="100" data-expected-height="0"></div>
          <div class="cell justifySelfStart firstRowSecondColumn directionRTL" data-offset-x="100" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfEnd firstRowSecondColumn directionRTL" data-offset-x="190" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfCenter secondRowFirstColumn directionRTL" data-offset-x="45" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfRight secondRowSecondColumn directionRTL" data-offset-x="190" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfLeft secondRowSecondColumn directionRTL" data-offset-x="100" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
      </div>

      <div style="position: relative" class="constrainedContainer">
      <div class="grid" data-expected-width="200" data-expected-height="400">
          <div class="cell justifySelfFlexEnd firstRowFirstColumn directionRTL" data-offset-x="0" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfFlexStart firstRowSecondColumn directionRTL" data-offset-x="100" data-offset-y="0" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfSelfStart secondRowFirstColumn directionRTL" data-offset-x="90" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
          <div class="cell justifySelfSelfEnd secondRowSecondColumn directionRTL" data-offset-x="100" data-offset-y="200" data-expected-width="10" data-expected-height="20"></div>
      </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
