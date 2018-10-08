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

main() {
  var styles = new DocumentFragment.html('''
      <style>
          .to_be_shown {
              display:none;
              color:green;
          }
          .to_be_hidden {
              display:block;
              color:red;
          }
      </style>
      <style>
          /* page rule must not interfere with non-page rules */
          #test1 {
              display:none;
          }
          @page {
              #test1 {
                  display:block;
              }
              @top-center {
                  content:"Test";
                  display:block;
              }
              #test2 {
                  display:block;
              }
          }
          #test2 {
              display:none;
          }
      </style>
      <style>
          /* Malformed page rule must not interfere with non-page rules as far as braces are paired properly */
          @page {
              p:before {
                  content:"malformed
              }
              @top-left
          }
          #test3 {
              display:none;
          }
      </style>
      <style>
          /* Successfully parsed */
          #last {
              display:block;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(styles);

  document.body.setInnerHtml('''
      <div class="to_be_hidden" id="test1">FAIL: Test 1</div>
      <div class="to_be_hidden" id="test2">FAIL: Test 2</div>
      <div class="to_be_hidden" id="test3">FAIL: Test 3</div>
      <div class="to_be_shown" id="last">PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
