/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant expression is an expression whose value can never
 * change, and that can be evaluated entirely at compile time.
 * A constant expression is one of the following:
 * . . .
 * • A constant constructor invocation that is not qualified by a deferred
 *   prefix.
 * @description Checks that a value created using constant constructor with
 * a deferred prefix is not a constant expression.
 * @compile-error
 * @author ngl@unipro.ru
 */

import '../../../Utils/expect.dart';
import 'constants_lib.dart' deferred as clib;

class A {
  const A() : a = "hello";
  final a;
}

final constList = const [
  const A(),
  const clib.A()
];

main() {
  Expect.isTrue(constList is List);
}
