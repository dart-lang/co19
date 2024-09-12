// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Library member declarations are library-global: All top-level
/// declarations in the library file and all transitive part files are equal,
/// and are all in scope in every file. They introduce declarations into the
/// library’s declaration scope, which is the most significant scope in all
/// files of the library. If there is any conflict with imported names,
/// top-level declarations win!
///
/// @description Check that all top-level declarations in the library file and
/// all transitive part files are all in scope in every file. Test that it is a
/// compile-time error to have a top-level declarations with the same name in a
/// different branches of a parts tree.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part 'top_level_A01_t05_branch1_part1.dart';
part 'top_level_A01_t05_branch2_part1.dart';

class A {}

main() {
  testB1p1();
  testB1p2();
  testB2p1();
  testB2p2();
}
