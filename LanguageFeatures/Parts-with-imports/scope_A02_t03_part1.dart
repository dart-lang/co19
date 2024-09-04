// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let’s introduce importsOf(S), where S is a set of `import`
/// directives from a single Dart file, to refer to that computation, which
/// introduces a scope containing the declarations introduced by all the
/// `import`s (the declarations of the export scope of each imported library,
/// minus those hidden by a `show` or `hide` operator, combined such that a name
/// conflicts of different declarations is not an error, but the name is marked
/// as conflicted in the scope, and then referencing it is an error.)
///
/// @description Check that unprefixed import scope contains all top-level
/// declarations introduced by all the `import` directives.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A02_t03.dart';

import 'scope_lib1.dart';
import 'scope_lib2.dart';

part 'scope_A02_t03_part2.dart';

testPart1() {
  // From scope_lib1.dart
  Expect.equals("libVar", libVar);
  Expect.equals("libGetter", libGetter);
  libSetter = "x";
  Expect.equals("libFunc", libFunc);
  Expect.equals("LibClass", LibClass.id);
  Expect.equals("LibMixin", LibMixin.id);
  Expect.equals("LibEnum", LibEnum.id);
  Expect.equals("LibExt", LibExt.id);
  Expect.equals("LibET", LibET.id);
  // From scope_lib2.dart
  Expect.equals("scope_lib2", libId);
}
