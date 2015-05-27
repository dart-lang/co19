/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that deprecated flexboxes treat min-width/min-height:auto as 0px.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "../../resources/check-layout.dart";

main() {
  var style = new Element.html('''
      <style>
      .flexbox {
          display: -webkit-box;
          width: 30px;
          height: 30px;
      }
      .item {
          -webkit-box-flex: 1;
          width: 20px;
          height: 20px;
      }
      .item:nth-child(1) {
          background-color: salmon;
          min-width: 0;
          min-height: 0;
      }
      .item:nth-child(2) {
          background-color: lightblue;
          min-width: auto;
          min-height: auto;
      }
      .item:nth-child(3) {
          background-color: orange;
          min-width: 30px;
          min-height: 30px;
      }
      .inline {
          display: inline-block;
          width: 20px;
          height: 20px;
      }
      .vertical {
          -webkit-box-orient: vertical;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''

      Tests that deprecated flexboxes treat min-width/min-height:auto as 0px.

      <div class="flexbox horizontal">
          <div class="item" data-expected-width=0 data-expected-height=20><div class="inline"></div></div>
          <div class="item" data-expected-width=0 data-expected-height=20><div class="inline"></div></div>
          <div class="item" data-expected-width=30 data-expected-height=30><div class="inline"></div></div>
      </div>

      <div class="flexbox vertical">
          <div class="item" data-expected-width=20 data-expected-height=0><div class="inline"></div></div>
          <div class="item" data-expected-width=20 data-expected-height=0><div class="inline"></div></div>
          <div class="item" data-expected-width=30 data-expected-height=30><div class="inline"></div></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  checkLayout('.flexbox');
}
