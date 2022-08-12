// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable only if
/// (a) it is private,
/// (b) it is final, and
/// (c) all other concrete instance getters with the same name in the same
/// library are also final fields
///
/// @description Checks that an instance field is promotable if all of the
/// conditions above are met. Test that the right variable is promoted
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

class A {
  final int? _x;
  A(this._x);
}

class C extends A {
  final int? _x;
  C(this._x) : super(_x);

  void testC() {
    if (_x != null) {
      super._x.isOdd;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    if (super._x != null) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

mixin M on A {
  final int? _x = 0;

  void testM() {
    if (_x != null) {
      super._x.isOdd;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    if (super._x != null) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  C(42).testC();
}
