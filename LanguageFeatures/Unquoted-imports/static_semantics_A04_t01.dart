// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Else if there is only a single segment:
/// ...
/// - Else:
///   - Let path be the concatenation of the segments, separated by `/`.
///   - The URI is "package:path.dart". So `import a/b/c/d;` imports
///     "package:a/b/c/d.dart".
///
/// @description Checks that `import test.package1/a/b/c;` imports
/// "package:test.package1/a/b/c.dart".
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import '../../Utils/expect.dart';
import test.package1/a/b;
import test.package1/a/b/c as l1;
import test.package1/a/b/c.d deferred as l2;

main() async {
  Expect.equals("b1", libraryId);
  Expect.equals("c1", l1.libraryId);
  await l2.loadLibrary();
  Expect.equals("c.d1", l2.libraryId);
}
