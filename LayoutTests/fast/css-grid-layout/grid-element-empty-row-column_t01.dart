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
      <link href=$root/resources/grid.css rel=stylesheet>
      <style>
      .gridNoRow {
          grid-template-columns: 50px;
          /* Make the grid shrink-to-fit. */
          position: absolute;
      }
      .gridNoColumn {
          grid-template-rows: 50px 80px;
          /* Make the grid shrink-to-fit. */
          position: absolute;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>This test checks that a grid element with row(s) (resp. column(s)) but no column (resp. row) is properly laid out.</p>
      <div class="grid gridNoRow" data-expected-width="50" data-expected-height="0"></div>
      <div class="grid gridNoColumn" data-expected-width="0" data-expected-height="130"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
