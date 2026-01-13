// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if `DV` is an extension type
/// declaration, and `DV` has a non-extension type member named `m` which is not
/// precluded by `DV` as well as an extension type member named `m` which is not
/// precluded by `DV`, for any `m`. In case of conflicts, `DV` must declare a
/// member named `m` to resolve the conflict.
///
/// @description Checks that it is a compile-time error if an extension type
/// declaration has a non-extension type member named `m` as well as an
/// extension type member named `m`. Test the non-extension type getter obtained
/// indirectly via another extension type.
/// @author sgrekhov22@gmail.com

extension type ET1(int id) {
  bool get isOdd => true;
}

extension type ET2(int id) implements int {}

extension type ET3(int id) implements ET1, ET2 {}
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET3);
}
