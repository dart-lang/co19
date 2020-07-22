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
 * @needsreview: ief2.offsetTo(ief1).x causes error
 *  "Specified element is not a transitive offset parent of this element"
 */
import "dart:html";
import "../testcommon.dart";
import "../../../Utils/expect.dart";

void check(num a, num b, String m) {
  Expect.equals(a, b, m);
}

main() {
  var b = document.body;
  if (b != null) {
    b.setInnerHtml('''<iframe class="ief1"
                   style="position: absolute; left: 10px; top: 10px">
          some text
         </iframe>''', treeSanitizer: new NullTreeSanitizer());
    IFrameElement ief1 = b.getElementsByClassName("ief1")[0] as IFrameElement;
    var ref = ief1.childNodes[0];

    IFrameElement ief2 = new Element.html('''<iframe  class="ief1"
                    style="position: absolute; left: 50px; top: 50px">
         </iframe>''', treeSanitizer: new NullTreeSanitizer()) as IFrameElement;
    ief1.insertBefore(ief2, ref);

    check(10, ief1
        .offsetTo(b)
        .x, "id1 relative to body x");
    check(20, ief1
        .offsetTo(b)
        .y, "id1 relative to body y");

    check(50, ief2
        .offsetTo(ief1)
        .x, "id2 relative to id1 x");
    check(50, ief2
        .offsetTo(ief1)
        .y, "id2 relative to id1 y");

    // indirect offsetParent
    check(60, ief2
        .offsetTo(b)
        .x, "id2 relative to body x");
    check(60, ief2
        .offsetTo(b)
        .y, "id2 relative to body y");
  } else {
    Expect.fail("Bodu is null");
  }
}
