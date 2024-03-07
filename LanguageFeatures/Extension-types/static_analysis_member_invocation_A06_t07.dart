// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an extension type declaration DV has an extension
/// type member named n in the cases where:
/// - DV declares a member named n.
/// - DV has no such declaration, but DV has a direct extension type
///   superinterface V that has an extension type member named n due to a member
///   declaration DM2, and DV does not declare a member that precludes DM2.
///
/// @description Checks that if an extension type `ET` has no superinterface
/// with a member `m` and doesn't declare it then it is a compile-time error to
/// call this member
/// @author sgrekhov22@gmail.com

extension type ET(int _) {}

main() {
  ET et = ET(42);
  et.ceil();
//   ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  et.isOdd;
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var ET(isEven: b) = et;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var n = switch (et) {
    ET(isEven: true) => true,
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => false
  };
}
