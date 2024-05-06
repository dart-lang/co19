// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that it is a compile-time error to access the value of
/// a local declaration named `_`. Test parameters of operators.
/// @author sgrekhov22@gmail.com

class C {
  int operator +(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  int operator [](int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }
  void operator []=(int index, int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M {
  int operator +(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  int operator [](int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }
  void operator []=(int _, int value) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E {
  e1;
  int operator +(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  int operator [](int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }
  void operator []=(int _, int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int id) {
  int operator +(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  int operator [](int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }
  void operator []=(int _, int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class A {}

extension Ext on A {
  int operator +(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  int operator [](int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }
  void operator []=(int _, int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}


main() {
  print(C);
  print(M);
  print(E);
  print(ET);
  print(A);
}
