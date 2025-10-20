// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `P`, the combined import scope of `F`, be a scope with `I` as
/// enclosing scope and a namespace containing every import prefix declared by
/// an import declaration of `F`.
///
/// - The `P` scope contains an entry for each name where the current file has
///   an `import` directive with that name as prefix. If an import is `deferred`,
///   it's a compile-time error if more than one `import` directive in the same
///   file has that prefix name, as usual. It's not an error if two deferred
///   import prefixes have the same name if they occur in different files, a
///   file can use any name as an import prefix for its own imports, as long as
///   it's not the name of a library declaration.
///
/// @description Check that a prefix scope contains an entry for each name where
/// the current file has an `import` directive with that name as prefix,
/// `as name`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A03_t01.dart';

import 'scope_lib1.dart' as l1;
import 'scope_lib2.dart' as l2;

part 'scope_A03_t01_part2.dart';

testPart1() {
  // From scope_lib1.dart
  Expect.equals("scope_lib1 libVar", l1.libVar);
  Expect.equals("scope_lib1 libGetter", l1.libGetter);
  l1.libSetter = "x";
  Expect.equals("scope_lib1 libFunc", l1.libFunc());
  Expect.equals("scope_lib1 LibClass", l1.LibClass.id);
  Expect.equals("scope_lib1 LibMixin", l1.LibMixin.id);
  Expect.equals("scope_lib1 LibEnum", l1.LibEnum.id);
  Expect.equals("scope_lib1 LibExt", l1.LibExt.id);
  Expect.equals("scope_lib1 LibET", l1.LibET.id);

  // From scope_lib2.dart
  Expect.equals("scope_lib2", l2.libId);
  Expect.equals("scope_lib2 lib2Func", l2.lib2Func());
}
