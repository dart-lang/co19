/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int tabIndex
 * Gets/sets the position of the element in the tabbing order.
 * @description Checks expected tabIndex attribute values
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  IFrameElement x = new Element.html('<iframe tabindex="1"></iframe>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.equals(1, x.tabIndex);

  x.setAttribute('tabindex', '2');
  Expect.equals(2, x.tabIndex);
}
