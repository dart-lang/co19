// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `MS` be the interface declared by the class declaration
/// ```
/// abstract class Msuper<P1, ..., Pm> implements T1, ..., Tn {}
/// ```
/// where `Msuper` is a fresh name. It is a compile-time error for the mixin
/// declaration if the `MS` class declaration would cause a compile-time error,
/// that is, if any member is declared by more than one declared superinterface,
/// and there is not a most specific signature for that member among the super
/// interfaces.
///
/// @description Checks that mixin declaration is allowed to have no
/// implementations of some of declared methods and properties.
/// @author sgrekhov@unipro.ru

abstract class I {
  int get i1;
  void i2();
  void set i3(int);
}
abstract class J {
  int get j1;
  void j2();
  void set j3(int);
}

abstract class B {
  int get b1;
  void b2();
  void set b3(int);
}
abstract class C {
  int get c1;
  void c2();
  void set c3(int);
}

mixin M on B, C implements I, J {}

main() {
  print(M);
}
