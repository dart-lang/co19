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

part of 'scope_A08_t02.dart';

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

part 'scope_A08_t02_part2.dart';

int l1 = 1;

int get l2 => 2;

enum l7 {e0;}

extension l8 on A {}

extension type l9(int _) {}

testPart1() {
}
