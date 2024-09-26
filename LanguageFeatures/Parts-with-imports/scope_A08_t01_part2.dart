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
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as n2;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as n3;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as n4;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as n5;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as n6;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as n7;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as n8;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' as n9;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified

int n1 = 1;

int get n2 => 2;

void set n3(int _) {}

int n4() => 4;

class n5 {}

mixin n6 {}

enum n7 {e0;}

extension n8 on A {}

extension type n9(int _) {}


testPart2() {
}
