/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that intrinsic width values on absolute positioned
 * elements don't shrink to avoid floats.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../resources/check-layout.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
          @import "$root/resources/width-keyword-classes.css";

          .container {
              border: 5px solid grey;
              width: 300px;
              height: 120px;
              margin-bottom: 5px;
              position: relative;
          }

          .container > div:last-child {
              border: 5px solid salmon;
              padding: 5px;
              width: 0px;
              display: -webkit-flex;
              -webkit-flex-wrap: wrap;
              position: absolute;
          }

          .child {
              display: inline-block;
              width: 100px;
              height: 50px;
              background-color: pink;
          }

          .float {
              float: right;
              width: 100px;
              height: 50px;
              border: 5px solid orange;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div class="container">
          <div class="float">Float</div>
          <div class="min-width-min-content" data-expected-width=120>
              <div class="child">Child 1</div>
              <div class="child">Child 2</div>
          </div>
      </div>

      <div class="container">
          <div class="float">Float</div>
          <div class="min-width-max-content" data-expected-width=220>
              <div class="child">Child 1</div>
              <div class="child">Child 2</div>
          </div>
      </div>

      <div class="container">
          <div class="float">Float</div>
          <div class="min-width-fit-content" data-expected-width=220>
              <div class="child">Child 1</div>
              <div class="child">Child 2</div>
          </div>
      </div>

      <div class="container">
          <div class="float">Float</div>
          <div class="min-width-fill-available" data-expected-width=300>
              <div class="child">Child 1</div>
              <div class="child">Child 2</div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.container');
    asyncEnd();
  });
}
