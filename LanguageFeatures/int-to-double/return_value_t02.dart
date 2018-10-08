/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test return value and hexadecimal integer literals
 * @author sgrekhov@unipro.ru
 */

class C {
  double get instanceGetter => 0x42;
  double get instanceGetter2 => (1 > 0 ? 0x42 : 3.14);
  double get instanceGetter3 => null ?? 0x42;
  static double get staticGetter => -0x42;
  static double get staticGetter2 => (1 > 0 ? 0x42 : 3.14);
  static double get staticGetter3 => null ?? -0x42;

  double instanceMethod() => 0x42;
  double instanceMethod2() => (1 > 0 ? 0x42 : 3.14);
  double instanceMethod3() => null ?? 0x42;
  static double staticMethod() => -0x42;
  static double staticMethod2() => (1 > 0 ? 0x42 : 3.14);
  static double staticMethod3() => null ?? -0x42;
}

double foo() => 0x42;
double foo2() => (1 > 0 ? 0x42 : 3.14);
double foo3() => (null ?? 0x42);

main() {
  double bar() => 0x42;
  double bar2() => (1 > 0 ? 0x42 : 3.14);
  double bar3() => (null ?? 0x42);

  foo();
  foo2();
  foo3();
  bar();
  bar2();
  bar3();
  C.staticGetter;
  C.staticGetter2;
  C.staticGetter3;
  C.staticMethod();
  C.staticMethod2();
  C.staticMethod3();

  C c = C();
  c.instanceGetter;
  c.instanceGetter2;
  c.instanceGetter3;
  c.instanceMethod();
  c.instanceMethod2();
  c.instanceMethod3();
}
