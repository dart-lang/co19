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

main() {
  var f = new DocumentFragment.html('''
      <style>
      .min-content {
          width: 10px;
          min-width: -webkit-min-content;
          min-width: -moz-min-content;
          min-width: -ie-min-content;
          min-width: -o-min-content;
          min-width: min-content;
          outline: 2px solid;
          display: -webkit-box;
          -webkit-box-lines: multiple;
      }
      .max-content {
          width: 10px;
          min-width: -webkit-max-content;
          min-width: -moz-max-content;
          min-width: -ie-max-content;
          min-width: -o-max-content;
          min-width: max-content;
          outline: 2px solid;
          display: -webkit-box;
          -webkit-box-lines: multiple;
      }
      .fit-content {
          width: 10px;
          min-width: -webkit-fit-content;
          min-width: -moz-fit-content;
          min-width: -ie-fit-content;
          min-width: -o-fit-content;
          min-width: fit-content;
          outline: 2px solid;
          display: -webkit-box;
          -webkit-box-lines: multiple;
      }
      .child {
          width: 20px;
          height: 20px;
          background-color: pink;
      }
      div {
          display: inline-block;
          line-height: 0;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Check that min-width intrinsic size still applies if a fixed width is set.</p>

      <div class="min-content" data-expected-width=20>
          <div class="child"></div><div class="child"></div>
      </div>

      <div class="max-content" data-expected-width=40>
          <div class="child"></div><div class="child"></div>
      </div>

      <div class="fit-content" data-expected-width=40>
          <div class="child"></div><div class="child"></div>
      </div>

      <div style="width: 30px">
          <div class="fit-content" data-expected-width=30>
              <div class="child"></div><div class="child"></div>
          </div>
      </div>

      <div style="width: 10px">
          <div class="fit-content" data-expected-width=20>
              <div class="child"></div><div class="child"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  checkLayout('body > div');
}
