// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Allow one or more `_`s between any two otherwise adjacent digits
/// of a `NUMBER` or `HEX_NUMBER` token. The following are not digits: The
/// leading `0x` or `0X` in `HEX_NUMBER`, and any `.`, `e`, `E`, `+` or `-` in
/// `NUMBER`.
///
/// That means only allowing `_`s between two `0-9` digits in `NUMBER` and
/// between two `0-9`, `a-f`, `A-F` digits in `HEX_NUMBER`.
///
/// @description Check that it is a compile-time error if `_` follows or is
/// followed by `e` or `E`.
/// @author sgrekhov22@gmail.com

const _e = 0;
const _E = 0;
const e_ = 0;
const E_ = 0;

const pi1 = 0.0314_e+2;
//          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final pi2 = 314_E-2;
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const pi3 = 0.0314e_2;
//          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final pi4 = 0.0314E_2;
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const e1 = 0.0272____e+2;
//         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final e2 = 272____E-2;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const e3 = 0.0272e__2;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const e4 = 0.0272E___2;
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(pi1);
  print(pi2);
  print(pi3);
  print(pi4);
  print(e1);
  print(e2);
  print(e3);
  print(e4);
}
