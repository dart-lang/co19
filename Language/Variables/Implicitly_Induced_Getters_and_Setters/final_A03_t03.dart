// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-late static variable declaration `D` named `id` that has
/// the modifier `final` or the modifier `const` does not induce a setter.
/// However, an assignment to `id` at a location where `D` is in scope is not
/// necessarily a compile-time error. For example, a setter named `id=` could be
/// found by lexical lookup.
///
/// @description Checks that it is not an error to "assign to a `final`
/// variable" if there is a setter with the same name in the scope.
/// @author sgrekhov22@gmail.com

mixin class A {
  void set c1(int _) {}
  void set c2(String _) {}
}

class C1 extends A {
  final c1 = 1;
  final int c2 = 2;
}

class C2 with A {
  final c1 = 1;
  final int c2 = 2;
}

enum E with A {
  e0;
  final c1 = 1;
  final int c2 = 2;
}

extension type ET1(A c1) implements A {}
extension type ET2(A c2) implements A {}

main() {
  print(C1().c1);
  C1().c1 = 0;
  print(C1().c2);
  C1().c2 = 'x';
  print(E.e0.c1);
  E.e0.c1 = 0;
  print(E.e0.c2);
  E.e0.c2 = 'x';
  print(ET1(A()).c1);
  ET1(A()).c1 = 0;
  print(ET2(A()).c2);
  ET2(A()).c2 = 'x';
}
