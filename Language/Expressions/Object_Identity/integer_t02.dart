/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The predeﬁned Dart function identical() is deﬁned such that
 * identical(c1, c2) iff:
 * . . .
 *  • c1 and c2 are instances of int and c1 == c2.
 * @description Checks that two large ints representing the same value are
 * identical.
 * @author kaigorodov
 * @reviewer rodionov
 * @note renamed from 1_Object_Identity_A01_t03.dart
 */
import "../../../Utils/expect.dart";

mul(var i1, var i2) {
  return i1 * i2;
}

main() {
  var i1 = 32000;
  var i2 = 33000;
  Expect.isTrue(identical(mul(i1, i2), mul(i2, i1)));
}
