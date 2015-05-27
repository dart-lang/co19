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
    <span>fix for <a href="http://bugs.webkit.org/show_bug.cgi?id=15274">bug 15274</a></span><br>
    <div name="my_a">div 1</div>
    <div name="my_a">div 2</div>
    <p></p>
    <p></p>
    ''', treeSanitizer: new NullTreeSanitizer());

  var divs = document.getElementsByName("my_a");
  divs[0].remove();
  shouldBe(divs.length, 1);
  divs[0].remove();
  shouldBe(divs.length, 0);

  divs = document.getElementsByTagName("p");
  divs[0].remove();
  shouldBe(divs.length, 1);
  divs[0].remove();
  shouldBe(divs.length, 0);
}
