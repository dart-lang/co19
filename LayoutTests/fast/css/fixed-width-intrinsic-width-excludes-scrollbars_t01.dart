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
  var style = new Element.html('''
      <style>
      .container {
          display: -webkit-flex;
          display: -moz-flex;
          display: -ie-flex;
          display: -o-flex;
          display: flex;
      }
      .container > div {
          overflow: scroll;
          width: 50px;
          height: 50px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
  
  document.body.setInnerHtml('''
      <div class="container" style="display: -webkit-flex">
          <div></div>
          <div style="display:-webkit-flex;"></div>
          <div style="display:-webkit-box;"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.querySelectorAll('.container > div').forEach((item) {
    item.setAttribute('data-expected-width', '50');
    item.setAttribute('data-expected-height', '50');
  });

  checkLayout('.container');
}
