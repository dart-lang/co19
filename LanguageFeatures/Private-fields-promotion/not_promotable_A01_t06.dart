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
/// @description Checks that an extension type instance getter is not promotable
/// @author sgrekhov22@gmail.com

extension type ET(int id) {
  int? get _x => 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  ET et = ET(42);
  if (et._x is int) {
    et._x.isEven;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  et.test();
}
