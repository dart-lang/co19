// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that no entry named `_` is introduced into the enclosing
/// scope by a wildcarded declaration. Test type parameters of generic functions
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcards

void topLevelFunction<_>() {
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C {
  static void staticMethod<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M {
  static void staticMethod<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E {
  e1;
  static void staticMethod<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int id) {
  static void staticMethod<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class A {}

extension Ext on A {
  static void staticMethod<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void instanceMethod<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  void localFunction<_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var functionExpression = <_>() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  print(topLevelFunction);
  print(localFunction);
  print(functionExpression);
  print(C);
  print(M);
  print(E);
  print(ET);
  print(A);
}
