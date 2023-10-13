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
/// @description Checks that an extension type representation variable is not
/// promotable if it is not private
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int? id) {
  void test() {
    if (id != null) {
      id.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension type ET2<T extends num>(T id) {
  void test() {
    if (id is int) {
      id.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  ET1 et1 = ET1(42);
  if (et1.id != null) {
    et1.x.isEven;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ET2 et2 = ET2<num>(42);
  if (et2.id is int) {
    et2.id.isEven;
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
