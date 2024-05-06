// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that it is a compile-time error to access the value of
/// a local declaration named `_`. Test type parameters of generic types.
/// @author sgrekhov22@gmail.com

class C<_> {
  void instanceMethod() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M<_> {
  void instanceMethod() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E<_> {
  e1;
  void instanceMethod() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET<_>(int id) {
  void instanceMethod() {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class A {}

extension Ext<_> on A {
  void instanceMethod() {
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
