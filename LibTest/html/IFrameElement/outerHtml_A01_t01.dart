/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String outerHtml
 * Gets the markup of the element including its content.
 * @description Checks expected outerHtml settings
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var h = '<iframe class="y"></iframe>';
  IFrameElement x = new Element.html(h, treeSanitizer: new NullTreeSanitizer());
  String y = x.outerHtml;
  Expect.equals(h, y);

  h = 'Content Text';
  x.innerHtml = h;
  y = x.outerHtml;
  Expect.equals('<iframe class="y">$h</iframe>', y);
}
