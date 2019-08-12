/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if the static type of e in the expression throw e
 * is not assignable to Object
 *
 * @description Check that it is an error if the static type of e in the
 * expression throw e is not assignable to Object
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class A {
}

void test(var x) {
  if (!(x is Object)) {
    throw x;
  }
}

main() {
  A? a = null;
  test(a);
}
