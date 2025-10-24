// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With this feature, imports are not global to the entire library,
/// and neither is extension availability.
///
/// Extension availability is defined per file, and an extension is available in
/// a Dart file if any of:
/// - The extension is declared by the library of the Dart file.
/// - The extension is available by import in the Dart file.
/// where an extension is available by import in a Dart file if any of:
/// - That file contains an import directive which imports the extension.
/// - That file is a part file and the extension is (recursively) available by
///   import in its parent file.
///
/// @description Check that an extension declared in a part file is available in
/// its parent file and vice versa.
/// @author sgrekhov22@gmail.com
/// @issue 61804

// SharedOptions=--enable-experiment=enhanced-parts

import '../../Utils/expect.dart';

part 'resolving_extensions_A01_t01_part1.dart';

class A {}

extension on A {
  String get id => "extension from root";
}

class C {}

main() {
  Expect.equals("extension from part1", C().getId());
  Expect.equals("extension from part2", C().getId2());
  testPart1();
  testPart2();
}
