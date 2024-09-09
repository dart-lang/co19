// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let P be a prefix scope containing all the import prefixes
/// declared by the current file. The parent scope of P is I.
/// - The P scope contains an entry for each name where the current file has an
///   `import` directive with that name as prefix, `as name`. (If an import is
///    `deferred`, it’s a compile-time error if more than one `import` directive
///    in the same file has that prefix name, as usual. It’s not an error if two
///    import deferred prefixes have the same name if they occur in different
///    files, other file’s imports are only suggestions.)
///
/// @description Check that a prefix scope contains an entry for each name where
/// the current file has an `import` directive with that name as prefix,
/// `as name`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A03_t01_part1.dart';

import 'scope_lib1.dart' as l3;
import 'scope_lib2.dart' as l4;

part 'scope_A03_t01_part2.dart';

testPart2() {
  // From scope_lib1.dart
  Expect.equals("scope_lib1 libVar", l1.libVar);
  Expect.equals("scope_lib1 libGetter", l1.libGetter);
  l1.libSetter = "x";
  Expect.equals("scope_lib1 libFunc", l1.libFunc);
  Expect.equals("scope_lib1 LibClass", l1.LibClass.id);
  Expect.equals("scope_lib1 LibMixin", l1.LibMixin.id);
  Expect.equals("scope_lib1 LibEnum", l1.LibEnum.id);
  Expect.equals("scope_lib1 LibExt", l1.LibExt.id);
  Expect.equals("scope_lib1 LibET", l1.LibET.id);

  Expect.equals("scope_lib1 libVar", l3.libVar);
  Expect.equals("scope_lib1 libGetter", l3.libGetter);
  l3.libSetter = "x";
  Expect.equals("scope_lib1 libFunc", l3.libFunc);
  Expect.equals("scope_lib1 LibClass", l3.LibClass.id);
  Expect.equals("scope_lib1 LibMixin", l3.LibMixin.id);
  Expect.equals("scope_lib1 LibEnum", l3.LibEnum.id);
  Expect.equals("scope_lib1 LibExt", l3.LibExt.id);
  Expect.equals("scope_lib1 LibET", l3.LibET.id);

  // From scope_lib2.dart
  Expect.equals("scope_lib2", l2.libId);
  Expect.equals("scope_lib2 lib2Func", l2.lib2Func());
  Expect.equals("scope_lib2", l4.libId);
  Expect.equals("scope_lib2 lib2Func", l4.lib2Func());
}
