/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Element.html(String html, {NodeValidator validator,
 *  NodeTreeSanitizer treeSanitizer})
 * Creates an HTML element from a valid fragment of HTML.
 * @description Checks expected element type
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div id="foo"></div>');
  Expect.isTrue(x is DivElement);
}
