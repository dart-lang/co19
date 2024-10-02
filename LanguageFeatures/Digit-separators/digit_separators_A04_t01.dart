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
/// @description Check that it is a compile-time error if number stats or ends
/// with `_`.
/// @author sgrekhov22@gmail.com

const one = _1;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

final two = 2_;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

var three = _0x3;
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

int four = 0X4_;
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

const five = ___5;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

final six = 6__;
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

var seven = __0x7;
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

int eight = 0X8__;
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

var pi1 = _3.14;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

var pi2 = ____3.14;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

num e1 = 2.71_;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

num e2 = 2.71____;
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(one);
  print(two);
  print(three);
  print(four);
  print(five);
  print(six);
  print(seven);
  print(eight);
  print(pi1);
  print(pi2);
  print(e1);
  print(e2);
}
