/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test arguments binding and generic routine
 * @author sgrekhov@unipro.ru
 */

class C<X> {
  void instanceMethod(X val) {}
  void instanceMethodPos(X val, [X pos]) {}
  void instanceMethodNam(X val, {X nam}) {}
}

void foo<X>(X x) {}

void positional1<X>(X d1, [X d2]) {}
void positional2<X>(dynamic x1, [X d2]) {}

void named1<X>(X d1, {X d2}) {}
void named2<X>(dynamic x1, {X d2}) {}

main() {
  C<double> c = C<double>();
  c.instanceMethod(42);
  c.instanceMethod(0x42);
  c.instanceMethod(1 > 0 ? 42 : 3.14);
  c.instanceMethod(1 > 0 ? 0x42 : 3.14);
  c.instanceMethod(null ?? 42);
  c.instanceMethod(null ?? 0x42);
  c.instanceMethodPos(42);
  c.instanceMethodPos(0x42);
  c.instanceMethodPos(1 > 0 ? 42 : 3.14);
  c.instanceMethodPos(1 > 0 ? 0x42 : 3.14);
  c.instanceMethodPos(null ?? 42);
  c.instanceMethodPos(null ?? 0x42);
  c.instanceMethodPos(42.0, 42);
  c.instanceMethodPos(42.0, 0x42);
  c.instanceMethodPos(42.0, 1 > 0 ? 42 : 3.14);
  c.instanceMethodPos(42.0, 1 > 0 ? 0x42 : 3.14);
  c.instanceMethodPos(42.0, null ?? 42);
  c.instanceMethodPos(42.0, null ?? 0x42);
  c.instanceMethodNam(42);
  c.instanceMethodNam(0x42);
  c.instanceMethodNam(1 > 0 ? 42 : 3.14);
  c.instanceMethodNam(1 > 0 ? 0x42 : 3.14);
  c.instanceMethodNam(null ?? 42);
  c.instanceMethodNam(null ?? 0x42);
  c.instanceMethodNam(42.0, nam: 42);
  c.instanceMethodNam(42.0, nam: 0x42);
  c.instanceMethodNam(42.0, nam: 1 > 0 ? 42 : 3.14);
  c.instanceMethodNam(42.0, nam: 1 > 0 ? 0x42 : 3.14);
  c.instanceMethodNam(42.0, nam: null ?? 42);
  c.instanceMethodNam(42.0, nam: null ?? 0x42);

  foo<double>(42);
  foo<double>(0x42);
  foo<double>(1 > 0 ? 42 : 3.14);
  foo<double>(1 > 0 ? 0x42 : 3.14);
  foo<double>(null ?? 42);
  foo<double>(null ?? 0x42);

  positional1<double>(42);
  positional1<double>(1 > 0 ? 42 : 3.14);
  positional1<double>(null ?? 42);
  positional1<double>(42.0, 42);
  positional2<double>(42, 42);
  positional1<double>(42.0, 1 > 0 ? 42 : 3.14);
  positional1<double>(null ?? 42);
  positional2<double>(42.0, 1 > 0 ? 42 : 3.14);
  positional2<double>(null ?? 42);
  positional1<double>(0x42);
  positional1<double>(1 > 0 ? 0x42 : 3.14);
  positional1<double>(null ?? 42);
  positional1<double>(42.0, 0x42);
  positional2<double>(42, 0x42);
  positional1<double>(42.0, 1 > 0 ? 0x42 : 3.14);
  positional1<double>(null ?? 42);
  positional2<double>(42.0, 1 > 0 ? 0x42 : 3.14);
  positional2<double>(null ?? 42);

  named1<double>(42);
  named1<double>(1 > 0 ? 42 : 3.14);
  named1<double>(null ?? 42);
  named1<double>(42.0, d2: 42);
  named1<double>(42.0, d2: 1 > 0 ? 42 : 3.14);
  named1<double>(42.0, d2: null ?? 42);
  named2<double>(42, d2: 42);
  named2<double>(42, d2: 1 > 0 ? 42 : 3.14);
  named2<double>(42, d2: null ?? 42);
  named1<double>(0x42);
  named1<double>(1 > 0 ? 0x42 : 3.14);
  named1<double>(null ?? 0x42);
  named1<double>(42.0, d2: 0x42);
  named1<double>(42.0, d2: 1 > 0 ? 0x42 : 3.14);
  named1<double>(42.0, d2: null ?? 0x42);
  named2<double>(42, d2: 0x42);
  named2<double>(42, d2: 1 > 0 ? 0x42 : 3.14);
  named2<double>(42, d2: null ?? 0x42);

  void bar<X>(X x) {}
  void barPos<X>(X x, [X d2]) {}
  void barNam<X>(X x, {X d2}) {}

  bar<double>(42);
  bar<double>(1 > 0 ? 42 : 3.14);
  bar<double>(null ?? 42);
  bar<double>(0x42);
  bar<double>(1 > 0 ? 0x42 : 3.14);
  bar<double>(null ?? 0x42);
  barPos<double>(42);
  barPos<double>(1 > 0 ? 42 : 3.14);
  barPos<double>(null ?? 42);
  barPos<double>(0x42);
  barPos<double>(1 > 0 ? 0x42 : 3.14);
  barPos<double>(null ?? 0x42);
  barPos<double>(42.0, 42);
  barPos<double>(42.0, 1 > 0 ? 42 : 3.14);
  barPos<double>(42.0, null ?? 42);
  barPos<double>(42.0, 0x42);
  barPos<double>(42.0, 1 > 0 ? 0x42 : 3.14);
  barPos<double>(42.0, null ?? 0x42);
  barNam<double>(42);
  barNam<double>(1 > 0 ? 42 : 3.14);
  barNam<double>(null ?? 42);
  barNam<double>(0x42);
  barNam<double>(1 > 0 ? 0x42 : 3.14);
  barNam<double>(null ?? 0x42);
  barNam<double>(42.0, d2: 42);
  barNam<double>(42.0, d2: 1 > 0 ? 42 : 3.14);
  barNam<double>(42.0, d2: null ?? 42);
  barNam<double>(42.0, d2: 0x42);
  barNam<double>(42.0, d2: 1 > 0 ? 0x42 : 3.14);
  barNam<double>(42.0, d2: null ?? 0x42);
}
