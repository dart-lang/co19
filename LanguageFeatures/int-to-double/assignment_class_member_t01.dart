/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test class member assignment
 * @author sgrekhov@unipro.ru
 */


class C {
  double m1 = 42;
  double m2 = (1 > 0 ? 42 : 3.14);
  double m3 = (null ?? 42);
  static const double m4 = -42;
  final double m5 = 23;

  static double s = -42;

  void set instanceSetter(double val) {
    m1 = val;
  }

  static void set staticSetter(double val) {
    s = val;
  }
}

main() {
  C.s = 42;
  C?.s = -42;
  C.s ??= 42;
  C?.s ??= -42;
  C.staticSetter = -42;
  C?.staticSetter = 42;

  C c = null;
  c?.m1 = 42;
  c?.instanceSetter = -42;
  c?.m1 ??= 42;

  c = new C();
  c.m1 = -42;
  c.instanceSetter = 42;
  c?.m1 = 42;
  c?.instanceSetter = -42;
  c.m1 ??= -42;
  c?.m1 ??= 42;
}
