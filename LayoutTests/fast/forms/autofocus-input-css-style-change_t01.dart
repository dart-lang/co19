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
  var f = new DocumentFragment.html('''
      <style>
      input { background: red; }
      input:focus { background: green; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>The following text box should have focus and should be green.</p>
      <input type="text" id="test" autofocus>
      ''', treeSanitizer: new NullTreeSanitizer());

  test() {
    var target = document.getElementById("test");
    target.offsetTop;
    shouldBe(getComputedStyle(target, null).getPropertyValue('background-color'),
       "rgb(0, 128, 0)");
    asyncEnd();
  }
  
  document.getElementById("test").onFocus.listen((_) => setTimeout(test));
  asyncStart();
}
