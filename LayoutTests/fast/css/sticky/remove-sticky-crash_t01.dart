/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
          body {
              margin: 0;
              height: 2000px;
          }
          
          .box {
              width: 200px;
              height: 200px;
          }

          .sticky {
              position: sticky;
              top: 100px;
              background-color: green;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This test should not crash</p>
      <div id="sticky" class="sticky box"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  doTest(_) {
    var stickyBox = document.getElementById('sticky');
    stickyBox.remove();
    window.scrollTo(0, 10);
    asyncEnd();
  }

  asyncStart();
  window.addEventListener('load', doTest, false);
}
