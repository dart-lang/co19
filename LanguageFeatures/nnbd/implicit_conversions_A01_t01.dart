/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The implicit conversion of integer literals to double literals is
 * performed when the context type is double or double?
 *
 * @description Check that the implicit conversion of integer literals to double
 * literals is performed when the context type is double or double?
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";
test1(double d) {
  Expect.equals(4.0, d);
}
test2(double? d) {
  Expect.equals(1.0, d);
}

main() {
  double d1 = 3;
  double? d2 = 1;
  Expect.equals(3.0, d1);
  Expect.equals(1.0, d2);

  test1(4);
  test2(1);
}
