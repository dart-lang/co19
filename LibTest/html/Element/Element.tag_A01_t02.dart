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
 * @description Checks that if tag is unknown, UnknownElement is created
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.tag('foo');
  Expect.isTrue(x is UnknownElement, 'foo is ${x.runtimeType}');
}
