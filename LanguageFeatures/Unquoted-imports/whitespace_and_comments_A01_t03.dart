// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All of the tokens in the path must be directly adjacent with no
/// whitespace, newlines, or comments between them.
///
/// @description Checks that it is not an error to have whitespaces, newlines
/// and comments outside of the path.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import '../../Utils/expect.dart';
import /* comment */ test.package1/dotted.name1;
import test_package2 // Ok
                    ;
import test_package2/a/b /* Ok */as l;

main() {
  Expect.equals("dotted.name1", dottedName1);
  Expect.equals("test_package2", testPackage2);
  Expect.equals("b2", l.libraryId);
}
