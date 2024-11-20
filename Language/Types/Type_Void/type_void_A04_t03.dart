// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that a type with `void` bound is not `dynamic`.
/// @author sgrekhov22@gmail.com

typedef Void = void;

void f<T extends Void>(T t) {
  t.notDynamic;
//  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A<T extends Void> {
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
  static void foo<T extends Void>(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void bar<T extends Void>(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M<T extends Void> {
  test(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E<T extends Void> {
  e0;
  test(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class C {}

extension Ext<T extends Void> on C {
  test(T t) {
    t.notDynamic;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET<T extends Void>(int _) {
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
