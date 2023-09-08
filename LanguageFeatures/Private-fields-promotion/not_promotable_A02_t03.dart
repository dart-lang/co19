// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that an enum field is not promotable if it is not
/// private
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

enum E {
  e1(1), e2(2);

  final int? x;
  final int? y = 42;
  const E(this.x);

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

main() {
  if (E.e1.x != null) {
    E.e1.x.isEven;
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (E.e2.y is int) {
    E.e2.y.isEven;
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  var _e1 = E.e1;
  if (_e1.x != null) {
    _e1.x.isEven;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  var _e2 = E.e2;
  if (_e2.y is int) {
    _e2.y.isEven;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  E.e1.test();
}
