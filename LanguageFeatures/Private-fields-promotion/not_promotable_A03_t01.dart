// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable if all the following conditions
/// hold:
/// - It refers to a field (not a getter)
/// - The field is private
/// - The field is final
/// - There is no getter with the same name elsewhere in the library
/// - There is no non-final field with the same name elsewhere in the library
/// - There is no implicit noSuchMethod forwarder with the same name elsewhere
///   in the library.
///
/// @description Checks that an instance field is not promotable if it is not
/// final
/// @author sgrekhov22@gmail.com

class C {
  int? _x;
  int? _y = 42;
  C(this._x);

  void test() {
    if (_x != null) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    if (_y is int) {
      _y.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

mixin M {
  int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

class MA = Object with M;

main() {
  C c = C(1);
  if (c._x is int) {
    c._x.isEven;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (c._y != null) {
    c._y.isEven;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  c.test();

  MA ma = MA();
  if (ma._x is int) {
    ma._x.isEven;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ma.test();
}
