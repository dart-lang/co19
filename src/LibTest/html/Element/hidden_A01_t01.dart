/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hidden
 * Indicates whether the element is not relevant to the page's current state.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<p></p>');
  Expect.isFalse(x.hidden);

  x = new Element.html('<p hidden></p>');
  Expect.isTrue(x.hidden);
}
