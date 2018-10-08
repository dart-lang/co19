/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test this assignment expression
 * @author sgrekhov@unipro.ru
 */

class C {
  double m1;

  void set instanceSetter(double val) {
    m1 = val;
  }

  test() {
    this.m1 = 42;
    this.m1 = (1 > 0 ? 42 : 3.14);
    this.m1 = (null ?? 42);
    this?.m1 = -42;
    this.m1 ??= 42;
    this?.m1 ??= -42;

    this.instanceSetter = 42;
    this?.instanceSetter = -42;
  }
}

main() {
  C c = C();
  c.test();
}
