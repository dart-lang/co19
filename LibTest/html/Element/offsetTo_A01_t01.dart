/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Point offsetTo(Element parent)
 * Provides the offset of this element's borderEdge relative to the specified
 * parent.
 * This is the Dart equivalent of jQuery's position method. Unlike jQuery's
 * position, however, parent can be any parent element of this, rather than
 * only this's immediate offsetParent. If the specified element is not an
 * offset parent or transitive offset parent to this element, an ArgumentError
 * is thrown.
 * @description Checks expected offset values
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  document.body.setInnerHtml('''

<div style="position: absolute; left: 10px; top: 10px" id="div1">
  some
  <div style="position: absolute; left: 50px; top: 50px" id="div2">
    text
  </div>
</div>''', treeSanitizer: new NullTreeSanitizer());

  var div1 = document.body.querySelector('#div1');
  var div2 = document.body.querySelector('#div2');

  var b = document.body;

  Expect.equals(10, div1.offsetTo(b).x, "div1 relative to body x");
  Expect.equals(10, div1.offsetTo(b).y, "div1 relative to body y");

  Expect.equals(50, div2.offsetTo(div1).x, "div2 relative to div1 x");
  Expect.equals(50, div2.offsetTo(div1).y, "div2 relative to div1 y");

  // indirect offsetParent
  Expect.equals(60, div2.offsetTo(b).x, "div2 relative to body x");
  Expect.equals(60, div2.offsetTo(b).y, "div2 relative to body y");
}
