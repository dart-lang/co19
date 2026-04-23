// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to call a method, setter, getter or operator on an
/// expression whose type is potentially nullable and not `dynamic`, except for
/// the methods, setters, getters, and operators on `Object`, and except when
/// said member is an extension member or the receiver type is an extension type
///
/// @description Check that it is a compile-time error to call a method, setter,
/// getter or operator on an expression whose type is potentially nullable.
/// @author sgrekhov@unipro.ru

class A {
  String m = "";
  void foo() {}
  int get bar => 1;
  void set baz(int i) {}
  A? operator+(A? other) => other;
}

mixin class M {
  String m = "";
  void foo() {}
  int get bar => 1;
  void set baz(int i) {}
  M? operator+(M? other) => other;
}

enum E {
  e0;
  final String m = "";
  void foo() {}
  int get bar => 1;
  void set baz(int i) {}
  E? operator+(E? other) => other;
}

extension type ET(int m) {
  void foo() {}
  int get bar => 1;
  void set baz(int i) {}
  ET? operator+(ET? other) => other;
}

main() {
  A? a = 2 > 1 ? A() : null;
  M? m = 2 > 1 ? M() : null;
  E? e = 2 > 1 ? E.e0 : null;
  ET? et = 2 > 1 ? ET(0) : null;

  a.m;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  a.foo();
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  a.bar;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  a.baz = 2;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  a + a;
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  m.m;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  m.foo();
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  m.bar;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  m.baz = 2;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  m + m;
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  e.m;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  e.foo();
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  e.bar;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  e.baz = 2;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  e + e;
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  et.m;
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  et.foo();
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
  et.bar;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
  et.baz = 2;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
  et + et;
//   ^
// [analyzer] unspecified
// [cfe] unspecified
}
