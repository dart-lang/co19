/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixinMember production allows the same instance or static
 * members that a class would allow, but no constructors (for now).
 *
 * @description Checks that mixin declaration allows same instance or static
 * members that a class would allow.
 * @author ngl@unipro.ru
 */

class I {}
class J {}

class B {}
class C {}

mixin M<X extends num, Y extends num> on B, C implements I, J {
  static int s1 = 1;
  static int get gs => s1;
  static set ss(int v) {
    s1 = v;
  }
  static int sf() => 11;
  Y i1;
  Y get gi;
  set si(Y v);
  Y mi();
}

class MA<X extends num, Y extends num> with M<X, Y> {
  Y i1 = 2.0 as Y;
  Y get gi => i1;
  set si(Y v) {
    i1 = v;
  }
  Y mi() => 22.0 as Y;
}

main() {
  new MA<int, double>();
}
