/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String getAttribute(String name)
 * Retrieve the value of the named attribute from the current node.
 * @description Checks expected attributes values.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new Element.html('<div id="id" custom="foobar"></div>',
      treeSanitizer: new NullTreeSanitizer());

  Expect.equals('id', x.getAttribute('id'));
  Expect.equals('foobar', x.getAttribute('custom'));
}
