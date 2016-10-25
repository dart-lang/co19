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
  document.body.setInnerHtml('''
      <p>Test error recovery in media query.</p>
      <style>
          @media ({});

          #test1 {
              display: none;
          }
      </style>

      <style>
          @media [{}];

          #test2 {
              display: none;
          }
      </style>

      <div id="test1">FAIL</div>
      <div id="test2">FAIL</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
