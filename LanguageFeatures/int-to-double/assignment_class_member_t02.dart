/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test class member assignment and hexadecimal values
 * @author sgrekhov@unipro.ru
 */


class C {
  double m1 = 0x42;
  double m2 = (1 > 0 ? 0x42 : 3.14);
  double m3 = (null ?? 0x42);
  static const double m4 = -0x42;
  final double m5 = 0x23;

  static double s = -0x42;

  void set instanceSetter(double val) {
    m1 = val;
  }

  static void set staticSetter(double val) {
    s = val;
  }
}

main() {
  C.s = 0x42;
  C?.s = -0x42;
  C.s ??= 0x42;
  C?.s ??= -0x42;
  C.staticSetter = -0x42;
  C?.staticSetter = 0x42;

  C c = null;
  c?.m1 = 0x42;
  c?.instanceSetter = -0x42;
  c?.m1 ??= 0x42;
  c = new C();
  c.m1 = -0x42;
  c.instanceSetter = 0x42;
  c?.m1 = 0x42;
  c?.instanceSetter = -0x42;
  c.m1 ??= -0x42;
  c?.m1 ??= 0x42;
}
