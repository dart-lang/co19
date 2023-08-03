// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type declaration DV
/// has two extension type superinterfaces V1 and V2, and both V1 and V2 has an
/// extension type member named m, and the two members have distinct
/// declarations.
///
/// @description Checks that it is a compile-time error if an extension type
/// declaration has a two extension type superinterfaces with a type member
/// named `m`, and the two members have distinct declarations.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int i) {
  int m() => 0;
}

extension type ET2(int i) {
  int m(int i) => 0;
}

extension type ET3(int i) implements ET1, ET2 {
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET3);
}
