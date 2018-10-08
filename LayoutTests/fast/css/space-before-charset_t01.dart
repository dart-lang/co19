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
  var style = new Element.html('''
      <style>
      @charset "utf-8";
      .green {
        background-color: green;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="probe" class="green">
      I should have a green background.
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    var elmt = document.getElementById("probe");  
    var color = getComputedStyle(elmt, null).getPropertyValue("background-color");  
    shouldBe(color, 'rgb(0, 128, 0)');
    asyncEnd();
  });
}
