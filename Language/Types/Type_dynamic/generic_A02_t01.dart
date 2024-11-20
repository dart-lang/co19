// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a generic type is used but type arguments are not provided,
/// the type arguments default to type `dynamic`.
///
/// @description Checks that a type with `dynamic` as a bound is `dynamic`.
/// @author sgrekhov22@gmail.com

typedef Dynamic = dynamic;

void f1<T extends dynamic>(T t) {
  t.whatever;
}

void f2<T extends Dynamic>(T t) {
  t.whatever;
}

class A<T1 extends dynamic, T2 extends Dynamic> {
  T1 t1;
  T2 t2;
  A(this.t1, this.t2);

  test() {
    t1.whatever;
    t2.whatever;
  }
}

class B {
  static void foo<T extends dynamic>(T t) {
    t.whatever;
  }
  void bar<T extends Dynamic>(T t) {
    t.whatever;
  }
}

mixin M<T extends dynamic> {
  test(T t) {
    t.whatever;
  }
}

enum E<T extends Dynamic> {
  e0;
  test(T t) {
    t.whatever;
  }
}

class C {}

extension Ext<T extends dynamic> on C {
  test(T t) {
    t.whatever;
  }
}

extension type ET<T extends Dynamic>(int _) {
  test(T t) {
    t.whatever;
  }
}

main() {
  print(f1);
  print(f2);
  print(A);
  print(M);
  print(E);
  print(C);
  print(ET);
}
