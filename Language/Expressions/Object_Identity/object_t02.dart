/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The predeﬁned Dart function identical() is deﬁned such that
 * identical(c1, c2) iff:
 *  • c1 and c2 are the same object.
 * @description Checks that an int and a double representing the same numerical
 * value are not identical.
 * @author kaigorodov
 * @reviewer rodionov
 * @note renamed from 1_Object_Identity_A06_t02.dart
 */
import "../../../Utils/expect.dart";

var i1 = 2;
var d2 = 2.0;

main() {
  Expect.isFalse(identical(i1, d2));
}
