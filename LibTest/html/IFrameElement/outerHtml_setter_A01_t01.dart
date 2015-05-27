/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String outerHtml
 * When used as a setter, replaces the element with nodes parsed from the
 * given string.
 * @description Checks expected outerHtml settings
 * @needsreview issue #17456
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var h = '<iframe class="y"></iframe>';
  IFrameElement x = new IFrameElement();
  x.outerHtml='<iframe class="y"></iframe>';
  return;
  String y=x.outerHtml;
  Expect.equals(h, y);

  h = '<iframe class="y">Content Text</iframe>';
  x.outerHtml=h;
  y=x.outerHtml;
  Expect.equals(h, y);
}
