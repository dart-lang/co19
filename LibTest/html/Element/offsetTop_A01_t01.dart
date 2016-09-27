/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int offsetTop
 * The distance from this element's top border to its offsetParent's top border.
 * @description Checks expected offset value
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  document.body.setInnerHtml('''

<div style="position: absolute; left: 10px; top: 10px" id="div1">
  some
  <div style="position: absolute; left: 50px; top: 60px" id="div2">
    text
  </div>
</div>''', treeSanitizer: new NullTreeSanitizer());

  var div2 = document.body.querySelector('#div2');

  Expect.equals(60, div2.offsetTop);
}
