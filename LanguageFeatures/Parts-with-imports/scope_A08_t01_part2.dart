// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if any file declares an import prefix
/// with the same base name as a top-level declaration of the library.
///
/// @description Check that it is a compile-time error if a part-file declares
/// an import prefix with the same base name as a top-level declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A08_t01_part1.dart';

import 'scope_lib2.dart' as l1;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as l2;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as l3;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as l4;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as l5;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as l6;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as l7;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as l8;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as l9;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified

import 'scope_lib2.dart' as p1;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as p2;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as p3;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as p4;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as p5;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as p6;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as p7;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as p8;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as p9;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified

import 'scope_lib2.dart' as n1;
import 'scope_lib2.dart' as n2;
import 'scope_lib2.dart' as n3;
import 'scope_lib2.dart' as n4;
import 'scope_lib2.dart' as n5;
import 'scope_lib2.dart' as n6;
import 'scope_lib2.dart' as n7;
import 'scope_lib2.dart' as n8;
import 'scope_lib2.dart' as n9;

int n1 = 1;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
int get n2 => 2;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
void set n3(int _) {}
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
int n4() => 4;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified

class n5 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
mixin n6 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
enum n7 {e0;}
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
extension n8 on A {}
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
extension type n9(int _) {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

testPart2() {
}
