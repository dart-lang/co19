/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion set classes(Iterable<String> value)
 * @description Checks that this property is assignable
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<iframe class="foo bar"></iframe>');
  Expect.isTrue(x.classes.contains("foo"), "foo");
  Expect.isTrue(x.classes.contains("bar"), "bar");
  Expect.isFalse(x.classes.contains("baz"), "baz");

  x.classes = ["baz", "foo"];
  Expect.isTrue(x.classes.contains("foo"), "foo");
  Expect.isFalse(x.classes.contains("bar"), "bar");
  Expect.isTrue(x.classes.contains("baz"), "baz");
}
