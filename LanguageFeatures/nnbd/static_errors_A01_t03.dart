// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to call a method, setter, getter or operator on an
/// expression whose type is potentially nullable and not `dynamic`, except for
/// the methods, setters, getters, and operators on `Object`, and except when
/// said member is an extension member or the receiver type is an extension type
///
/// @description Check that it is no compile-time error to call a method, setter,
/// getter or operator on an expression whose type is `dynamic`.
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

extension type ET(int _) {
  void foo() {}
  int get bar => 1;
  void set baz(int i) {}
  ET? operator+(ET? other) => other;
}

main() {
  dynamic a = 2 > 1 ? A() : null;
  dynamic m = 2 > 1 ? M() : null;
  dynamic e = 2 > 1 ? E.e0 : null;
  dynamic et = 2 > 1 ? ET(0) : null;

  a.m;
  a.foo();
  a.bar;
  a.baz = 2;
  a + a;

  m.m;
  m.foo();
  m.bar;
  m.baz = 2;
  m + m;

  e.m;
  e.foo();
  e.bar;
  e.baz = 2;
  e + e;

  if (1 > 2) { // The runtime type of et is `int`, so it doesn't have members of ET.
    et.foo();
    et.bar;
    et.baz = 2;
  }
  et + et;
}
