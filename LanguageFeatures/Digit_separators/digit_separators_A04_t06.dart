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
/// followed by `+` or `-`.
/// @author sgrekhov22@gmail.com

const pi1 = 0.0314e_+2;
//          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final pi2 = 314E_-2;
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const pi3 = 0.0314e__+2;
//          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final pi4 = 314E___-2;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const e1 = 0.0272e+_2;
//         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final e2 = 272E-_2;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const e3 = 0.0272e+__2;
//         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final e4 = 272E-____2;
//         ^^^^^^^^^^
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
