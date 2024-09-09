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

part of 'scope_A08_t02_part1.dart';

int l1 = 1;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
int get l2 => 2;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
void set l3(int _) {}
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
int l4() => 4;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
class l5 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
mixin l6 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
enum l7 {e0;}
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
extension l8 on A {}
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
extension type l9(int _) {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

int p1 = 1;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
int get p2 => 2;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
void set p3(int _) {}
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
int p4() => 4;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
class p5 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
mixin p6 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
enum p7 {e0;}
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
extension p8 on A {}
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
extension type p9(int _) {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

testPart2() {
}
