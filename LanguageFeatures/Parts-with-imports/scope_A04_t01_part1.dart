// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `P`, the combined import scope of `F`, be a scope with `I` as
/// enclosing scope and a namespace containing every import prefix declared by
/// an import declaration of `F`.
/// ...
/// - The `P` scope binds each such name to a prefix (import) scope, `Pname`,
///   computed as `importsOf(Sname)` where `Sname` is the set of import
///   directives of `F` with that prefix name.
///
/// @description Check that a prefixed import scope contains an entry from each
/// import directive with the same prefix name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A04_t01.dart';

import 'scope_lib1.dart' as l;

part 'scope_A04_t01_part2.dart';

testPart1() {
  // From scope_lib1.dart
  Expect.equals("scope_lib1 libVar", l.libVar);
  Expect.equals("scope_lib1 libGetter", l.libGetter);
  l.libSetter = "x";
  Expect.equals("scope_lib1 libFunc", l.libFunc());
  Expect.equals("scope_lib1 LibClass", l.LibClass.id);
  Expect.equals("scope_lib1 LibMixin", l.LibMixin.id);
  Expect.equals("scope_lib1 LibEnum", l.LibEnum.id);
  Expect.equals("scope_lib1 LibExt", l.LibExt.id);
  Expect.equals("scope_lib1 LibET", l.LibET.id);
}
