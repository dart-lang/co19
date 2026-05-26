// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-late static variable declaration `D` named `id` that has
/// the modifier `final` or the modifier `const` does not induce a setter.
/// However, an assignment to `id` at a location where `D` is in scope is not
/// necessarily a compile-time error. For example, a setter named `id=` could be
/// found by lexical lookup.
///
/// @description Checks that it is not an error to assign to a `final` variable
/// if there is a setter with the same name in the scope.
/// @author sgrekhov22@gmail.com
/// @issue 63440

final c1 = 1;
final c2 = 2;

void set c1(int _) {}
void set c2(String _) {}

class C {
  static final c1 = 1;
  static final c2 = 2;
  final c3 = 3;
  final c4 = 4;
  static void set c1(int _) {}
  static void set c2(String _) {}
  void set c3(int _) {}
  void set c4(String _) {}
}

mixin M {
  static final c1 = 1;
  static final c2 = 2;
  final c3 = 3;
  final c4 = 4;
  static void set c1(int _) {}
  static void set c2(String _) {}
  void set c3(int _) {}
  void set c4(String _) {}
}

enum E {
  e0;
  static final c1 = 1;
  static final c2 = 2;
  final c3 = 3;
  final c4 = 4;
  static void set c1(int _) {}
  static void set c2(String _) {}
  void set c3(int _) {}
  void set c4(String _) {}
}

class A {}

extension Ext on A {
  static final c1 = 1;
  static final c2 = 2;
  static void set c1(int _) {}
  static void set c2(String _) {}
}

extension type ET(int _) {
  static final c1 = 1;
  static final c2 = 2;
  static void set c1(int _) {}
  static void set c2(String _) {}
}

class MA = Object with M;

main() {
  c1 = 42;
  c2 = '42';
  C.c1 = 42;
  C.c2 = '42';
  C().c3 = 42;
  C().c4 = '42';
  M.c1 = 42;
  M.c2 = '42';
  MA().c3 = 42;
  MA().c4 = '42';
  E.c1 = 42;
  E.c2 = '42';
  E.e0.c3 = 42;
  E.e0.c4 = '42';
  Ext.c1 = 42;
  Ext.c2 = '42';
  ET.c1 = 42;
  ET.c2 = '42';
}
