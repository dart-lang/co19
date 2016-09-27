/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int tabIndex
 * @description Checks expected tabIndex attribute values
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  Element x = new Element.html('<div tabindex="1"><p tabindex="2"></p></div>',
      treeSanitizer: new NullTreeSanitizer());

  Expect.equals(1, x.tabIndex);
  Expect.equals(2, (x.firstChild as Element).tabIndex);
}
