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
/// @description Check that if there is a conflict with imported names,
/// top-level declarations win.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'top_level_A02_t01.dart';
part 'top_level_A02_t01_part2.dart';

String get libGetter => "libGetter part1";

class LibClass {
  static final id = "LibClass part1";
}

extension type LibET(int _) {
  static final id = "LibET part1";
}
