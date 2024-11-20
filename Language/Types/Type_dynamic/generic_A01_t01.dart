// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a generic type is used but type arguments are not provided,
/// the type arguments default to type `dynamic`.
///
/// @description Checks that a static type of a type parameter with no bounds is
/// not `dynamic`.
/// @author sgrekhov22@gmail.com

void f<T>(T t) {
  t.notDynamic;
//  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A<T> {
  T t;
  A(this.t);

  test() {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class B {
  static void foo<T>(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void bar<T>(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M<T> {
  test(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E<T> {
  e0;
  test(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class C {}

extension Ext<T> on C {
  test(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET<T >(int _) {
  test(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(f);
  print(A);
  print(M);
  print(E);
  print(C);
  print(ET);
}
