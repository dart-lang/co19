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
      <div id="div" style="position:relative; right:40px">test left overflow in LTR page.</div>
      <ul id="console"></ul>
      ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.getElementById("div");
  var original = window.scrollX;
  window.scrollTo(-1, 0);
  shouldBe(window.scrollX, 0);
}
