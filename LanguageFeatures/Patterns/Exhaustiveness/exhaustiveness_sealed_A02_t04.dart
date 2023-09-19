// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is a compile-time error if matched type of a
/// switch expression is a sealed class and cases are not exhaustive
/// @author sgrekhov22@gmail.com
/// @issue 53392

sealed class S {}

mixin M on S {}

class C extends S {}

class F implements M {}

void main() {
  S s = F();
  int i1 = switch (s) { C _ => 1 };
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int i2 = switch (s) { F _ => 1 };
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int i3 = switch (s) { M _ => 1 };
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var i4 = switch (s) { C _ => 1, F _ => 2 };
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final i5 = switch (s) { M _ => 1, F _ => 2 };
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int i6 = switch (s) { C _ => 1, M _ => 2 }; // Ok, exhaustive
}
