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
/// @description Check that it’s a compile-time error if two deferred `import`
/// directives in the same part file have the same prefix name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A03_t02.dart';

import 'scope_lib1.dart' deferred as d;
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
import 'scope_lib2.dart' deferred as d;
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

part 'scope_A03_t02_part2.dart'

testPart1() {
  print("Part 1");
}
