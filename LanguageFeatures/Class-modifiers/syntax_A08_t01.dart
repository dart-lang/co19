// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Many combinations don't make sense:
/// ...
/// - A mixin or mixin class declaration is intended to be mixed in, so its
///   declaration cannot have an interface, final or sealed modifier.
///
/// @description Check that it is a compile-time error if `mixin` or
/// `mixin class` have modifiers `interface`, `final` or `sealed`
/// @author sgrekhov22@gmail.com

  interface mixin M1 {}
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final mixin M2 {}
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  sealed mixin M3 {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  interface mixin class M4 {}
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final mixin class M5 {}
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  sealed mixin class M6 {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
  print(M5);
  print(M6);
}
