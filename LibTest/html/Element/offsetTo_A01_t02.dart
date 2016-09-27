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
 * @description Checks that ArgumentError is thrown if parent is not an
 * offset parent or transitive offset parent.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new ButtonElement();
  var y = new ButtonElement();
  document.body.append(x);
  document.body.append(y);

  Expect.throws(() {
    y.offsetTo(x);
  }, (e) => e is ArgumentError);
}
