/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Element.tag(String tag, [String typeExtention])
 * Creates the HTML element specified by the tag name.
 * This is similar to Document.createElement. tag should be a valid HTML tag
 * name. If tag is an unknown tag then this will create an UnknownElement.
 * @description Checks that tag can be any valid html5 tag name.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  for (var i in Html5Elements) {
    var x = new Element.tag(i);
    Expect.isFalse(x is UnknownElement, i);
  }
}
