/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classes
 * The set of CSS classes applied to this element.
 * @description Checks that set contains expected classes
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div class="foo bar"></div>');
  Expect.isTrue(x.classes.contains("foo"), "foo");
  Expect.isTrue(x.classes.contains("bar"), "bar");
  Expect.isFalse(x.classes.contains("baz"), "baz");
}
