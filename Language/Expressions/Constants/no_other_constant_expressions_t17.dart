// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form [e is T] is potentially constant if [e]
/// is a potentially constant expression and [T] is a constant type expression,
/// and it is further constant if [e] is constant.
/// @description Checks that a type test expression can be used to initialize a
/// constant variable.
/// @author iefremov

import "../../../Utils/expect.dart";

const m1 = null is Object;
const m2 = "testme" is String;
const m3 = "testme" is int;

main() {
  Expect.isFalse(m1);
  Expect.isTrue(m2);
  Expect.isFalse(m3);
}
