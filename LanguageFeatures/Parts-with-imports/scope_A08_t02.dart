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

part 'scope_A08_t02_part1.dart';

class A {}

main() {
  testPart1();
  testPart2();
}
