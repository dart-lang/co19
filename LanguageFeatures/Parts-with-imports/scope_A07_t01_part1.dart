// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The combined import scope of a Dart file is a chain of the
/// combined import scopes of the file and its parent files, each step adding
/// two scopes: The (unnamed, top-level) import scope of the unprefixed imports
/// and the prefix scope with prefixed imports, each shadowing names further up
/// in the chain.
///
/// @description Check that it is a compile-time error to access an import
/// declared in any of part files.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A07_t01.dart';

import 'scope_lib1.dart';
import 'scope_lib2.dart' as l1;

part 'scope_A07_t01_part2.dart';

testPart1() {
  print(libVar); // from scope_lib1.dart
  print(l1.lib2Func()); // from scope_lib2.dart
  print(counter); // from parts_lib.dart
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
