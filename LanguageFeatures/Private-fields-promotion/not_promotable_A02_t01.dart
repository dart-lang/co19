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
/// private
/// @author sgrekhov22@gmail.com

class C {
  final int? x;
  final int? y = 42;
  C(this.x);

  void test() {
    if (x != null) {
      x.isOdd;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    if (y != null) {
      y.isOdd;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

mixin M {
  final int? x = 42;

  void test() {
    if (x != null) {
      x.isOdd;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

class MA = Object with M;

main() {
  C c = C(42);
  if (c.x != null) {
    c.x.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (c.y is int) {
    c.y.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  c.test();

  MA ma = MA();
  if (ma.x != null) {
    ma.x.isEven;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ma.test();
}
