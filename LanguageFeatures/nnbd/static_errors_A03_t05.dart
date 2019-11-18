/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call an expression whose type is potentially
 * nullable and not dynamic.
 *
 * @description Check that it is no compile-time error to call an expression
 * whose type is dynamic.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

int foo() => 42;
typedef int Foo();

main() {
  dynamic f1 = foo;
  Expect.equals(42, f1());

  dynamic f2 = foo;
  Expect.equals(42, f2());
}
