/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool spellcheck
 * Controls spell-checking (present on all HTML elements)
 * @description Checks that modification of the attribute is reflected in the
 * element
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<p></p>');
  x.spellcheck = true;

  Expect.equals('<p spellcheck="true"></p>', x.outerHtml);
}
