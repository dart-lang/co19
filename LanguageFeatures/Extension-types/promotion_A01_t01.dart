// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The representation variable is not a subject to promotion
///
/// @description Check that the representation variable is not promotable
/// @author sgrekhov22@gmail.com
/// @issue 53446

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

extension type ET2<T>(T id) {
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
  ET1 et1 = ET1(1);
  if (et1.id != null) {
    et1.id.isEven;
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ET2<num?> et2 = ET2(2);
  if (et2.id is int) {
    et2.id.isEven;
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
