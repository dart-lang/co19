// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that it is a compile-time error to access the value of
/// a local declaration named `_`. Test parameters of functions and methods.
/// @author sgrekhov22@gmail.com

void topLevelFunction1(int _) {
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void topLevelFunction2([int _ = 1]) {
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C {
  static void staticMethod1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static void staticMethod2([int _ = 2]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod2([int _ = 3]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M {
  static void staticMethod1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static void staticMethod2([int _ = 4]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod2([int _ = 5]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E {
  e1;
  static void staticMethod1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static void staticMethod2([int _ = 6]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod2([int _ = 7]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int _) {
  static void staticMethod1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static void staticMethod2([int _ = 8]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod2([int _ = 9]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class A {}

extension Ext on A {
  static void staticMethod1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static void staticMethod2([int _ = 10]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod2([int _ = 11]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  void localFunction1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void localFunction2([int _ = 12]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  var functionExpression1 = (int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var functionExpression2 = ([int _ = 13]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  print(topLevelFunction1);
  print(topLevelFunction2);
  print(localFunction1);
  print(localFunction2);
  print(functionExpression1);
  print(functionExpression2);
  print(C);
  print(M);
  print(E);
  print(ET);
  print(A);
}
