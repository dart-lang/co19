/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String title
 * @description Checks expected title attribute values
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  Element x = new Element.html('<div title="one"><p title="two"></p></div>',
      treeSanitizer: new NullTreeSanitizer());

  Expect.equals("one", x.title);
  Expect.equals("two", (x.firstChild as Element).title);
}
