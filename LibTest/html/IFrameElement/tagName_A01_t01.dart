/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String tagName
 * The name of the tag for the given element.
 * @description Checks value of IFrameElement.tagName
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new Element.html('<iframe></iframe>');
  Expect.equals("IFRAME", x.tagName);

  x = new IFrameElement();
  Expect.equals("IFRAME", x.tagName);
}
