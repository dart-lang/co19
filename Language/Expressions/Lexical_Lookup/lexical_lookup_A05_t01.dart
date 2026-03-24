// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider the situation where a name `n` has basename `id` where
/// `id` is an identifier, and a lexical lookup of `n` is performed from a given
/// location `ℓ`.
/// ...
/// Let `S` be the innermost lexical scope containing `ℓ` which has a
/// declaration with basename `id`. In the case where `S` has a declaration
/// named `id` as well as a declaration named `id=`, let `D` be the declaration
/// named `n`. In the situation where `S` has exactly one declaration with
/// basename `id`, let `D` be that declaration.
/// ...
/// In the second and last step, if no error occurred, proceed as described in
/// the first applicable case from the following list:
/// ...
/// - Consider the case where `D` is a formal type parameter declaration of a
///   class or a mixin. It is a compile-time error if `ℓ` occurs inside a static
///   method, static getter, or static setter, or inside a static variable
///   initializer. Otherwise, the lexical lookup yields `D`.
///
/// @description Checks that it is a compile-time error if `D` is a formal type
/// parameter declaration and `ℓ` occurs inside a static method, static getter,
/// or static setter, or inside a static variable initializer.
/// @author sgrekhov22@gmail.com

class C<T> {
  static void method() {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static int get getter {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }
  static void set setter(int _) {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static Type variable = T;
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M<T> {
  static void method() {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static int get getter {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }
  static void set setter(int _) {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static Type variable = T;
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E<T> {
  e0;
  static void method() {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static int get getter {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }
  static void set setter(int _) {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static Type variable = T;
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext<T> on A {
  static void method() {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static int get getter {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }
  static void set setter(int _) {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static Type variable = T;
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET<T>(int _) {
  static void method() {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static int get getter {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }
  static void set setter(int _) {
    print(T);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static Type variable = T;
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
