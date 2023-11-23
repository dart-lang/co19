// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if DV is an extension type
/// declaration, and DV has a non-extension type member named m, and the
/// computation of a combined member signature for all non-extension type
/// members named m fails.
///
/// @description Checks that it is a compile-time error if an extension type
/// declaration has a non-extension type member named `m`, and the computation
/// of a combined member signature for all non-extension type members named `m`
/// fails.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

class A {
  void m(int i) {}
}

class B {
  void m(double d) {}
}

class C implements A, B {
  void m(num n) {}
}

extension type ET(C c) implements A, B {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET);
}
