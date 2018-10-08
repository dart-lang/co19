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
import "pwd.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var link = new Element.html('''
      <link rel="stylesheet" href="$root/resources/comment-before-charset.css" />
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(link);

  document.body.setInnerHtml('''
      <div id="probe" class="green">
      I should have a green background.
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();

  window.onLoad.listen((_) {
    var elmt = document.getElementById("probe");  
    var color = getComputedStyle(elmt).getPropertyValue("background-color");
    shouldBe(color, 'rgb(0, 128, 0)');
    asyncEnd();
  });
}
