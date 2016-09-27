/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Element offsetParent
 * The element from which all offset calculations are currently computed.
 * @description Checks expected offsetParent
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  document.body.setInnerHtml('''

<div style="position: absolute; left: 10px; top: 10px" id="div1">
  some
  <div id="div2">
    text
  </div>
</div>
<div id="div3">
  some
  <div id="div4">
    text
  </div>
</div>''', treeSanitizer: new NullTreeSanitizer());

  var div1 = document.body.querySelector('#div1');
  var div2 = document.body.querySelector('#div2');
  var div3 = document.body.querySelector('#div3');
  var div4 = document.body.querySelector('#div4');

  var b = document.body;

  Expect.identical(b, div1.offsetParent, 'div1');
  Expect.identical(div1, div2.offsetParent, 'div2');
  Expect.identical(b, div3.offsetParent, 'div3');
  Expect.identical(b, div4.offsetParent, 'div4');
}
