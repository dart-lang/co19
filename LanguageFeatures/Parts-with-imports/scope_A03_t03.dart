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
/// @description Check that it is not an error if two deferred `import`
/// directives have the same prefix name but occurs in a different files.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

import '../../Utils/expect.dart';
part 'scope_A03_t03_part1.dart';

main() {
  testPart1();
  testPart2();
}
