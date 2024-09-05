// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let P be a prefix scope containing all the import prefixes
/// declared by the current file. The parent scope of P is I.
/// ...
/// - The P scope binds each such name to a prefix import scope, Pname, computed
///   as importsOf(Sname) where Sname is the set of import directives with that
///   prefix name.
///
/// @description Check that a prefixed import scope contains an entry from each
/// import directives with the same prefix name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

import '../../Utils/expect.dart';
part 'scope_A04_t01_part1.dart';

main() {
  testPart1();
  testPart2();
}
