// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if DV is an extension type
/// declaration, and DV has a non-extension type member named m as well as an
/// extension type member named m, for any m.
///
/// @description Checks that it is a compile-time error if an extension type
/// declaration has a non-extension type member named `m` as well as an
/// extension type member named `m`.
/// @author sgrekhov22@gmail.com

class A {
  void set m(int v) {}
}

extension type ET1(A a) {
  void set m(int v) {}
}

extension type ET2(A id) implements A, ET1 {
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET2);
}
