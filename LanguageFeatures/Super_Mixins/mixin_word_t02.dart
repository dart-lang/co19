/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixin word is a built-in identifier to avoid parsing
 * ambiguities. It does not need to be a reserved word. The identifier mixin was
 * made a built-in identifier in Dart 2.0
 *
 * @description Checks that the mixin word can be used as a variable name
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

double mixin = 3.14;

test () {
  double mixin = -3.14;
  Expect.equals(-3.14, mixin);
}

main() {
  Expect.equals(3.14, mixin);
  test();
}
