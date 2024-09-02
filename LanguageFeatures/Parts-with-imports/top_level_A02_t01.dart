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

import 'parts_lib.dart';
import '../../Utils/expect.dart';

part 'top_level_A02_t01_part1.dart';

String libVar = "libVar main";
String libFunc() => "libFunc main";

mixin LibMixin {
  static final id = "LibMixin main";
}

class A {}

extension LibExt on A {
  static final id = "LibExt main";
}

main() {
  Expect.equals("libVar main", libVar);
  Expect.equals("libGetter part1", libGetter);
  libSetter = "x";
  Expect.equals("libSetter part2", log);
  Expect.equals("libFunc main", libFunc);
  Expect.equals("LibClass part1", LibClass.id);
  Expect.equals("LibMixin main", LibMixin.id);
  Expect.equals("LibEnum part2", LibEnum.id);
  Expect.equals("LibExt main", LibExt.id);
  Expect.equals("LibET part1", LibET.id);
}
