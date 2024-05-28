// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that no entry named `_` is introduced into the enclosing
/// scope by a wildcarded declaration. Test covariant parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C {
  void foo(covariant num _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void bar([covariant num _ = 0]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M {
  void foo(covariant num _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void bar([covariant num _ = 0]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E {
  e0;
  void foo(covariant num _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void bar([covariant num _ = 0]) {
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
}
