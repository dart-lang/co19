/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call a method, setter, or getter on a receiver
 * of static type Never (including via a null aware operator).
 *
 * @description Check that it is an error to call a method, setter, or getter on
 * a receiver of static type Never (including via a null aware operator). Test
 * type aliases
 * @author sgrekhov@unipro.ru
 * @issue 39866
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
typedef Neverland = Never;

void test(var x) {
  if (x is Neverland) {
    x.toString();
    x.runtimeType;
    x.s = 1;
    x?.toString();
    x?.runtimeType;
    x?.s = 1;
    x?..toString();
    x?..runtimeType;
    x?..s = 1;
  }
}

main() {
  test(null);
}
