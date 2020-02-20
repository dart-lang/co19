/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is not an error to call or tear-off a method, setter, or
 * getter, or to read or write a field, on a receiver of static type Never.
 * Implementations that provide feedback about dead or unreachable code are
 * encouraged to indicate that any arguments to the invocation are unreachable.
 *
 * @description Check that it is not an error to call a method, setter, or
 * getter on a receiver of static type Never.
 * @author sgrekhov@unipro.ru
 * @issue 39866
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
void test(var x) {
  if (x is Never) {
    x.toString();
    x.runtimeType;
    x.s = 1;
  }
}

main() {
  test(null);
}
