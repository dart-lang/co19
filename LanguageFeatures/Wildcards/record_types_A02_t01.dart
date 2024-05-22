// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Named fields of record types are unchanged. It is still a
/// compile-time error for a named field name to start with `_`.
///
/// @description Checks that it is still a compile-time error for a named field
/// name to start with `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

typedef R1 = (int _, {String _});
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

typedef _ = ({int _});
//                ^
// [analyzer] unspecified
// [cfe] unspecified

typedef ({int _}) R3();
//            ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R4(({String _}) r);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

({int _})? f1() => null;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

void f2(({String _}) r) {}
//               ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  late ({int _}) r0;
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  R1 r1 = (1, _: "2");
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  _ r2 = (_: 1);
//        ^
// [analyzer] unspecified
// [cfe] unspecified

  print(R3);
  print(R4);
  print(f1);
  print(f2);

  dynamic d = (s: "pi");
  if (d is ({String _})) {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

  d as ({String _});
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}
