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
/// @description Check that if unprefixed imports of a part file contain
/// conflicting names it is not an error if those names are not referenced.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A02_t01.dart';

import 'scope_lib1.dart';
import 'parts_lib.dart';

part 'scope_A02_t01_part2.dart';

testPart1() {
  print(scope); // From scope_lib1.dart
  print(counter); // From parts_lib.dart
}
