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
/// @description Checks that `export test_package2/a/b/c;` exports
/// "package:test_package2/a/b/c.dart".
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import '../../Utils/expect.dart';
import 'static_semantics_A04_t04_lib.dart';

main() {
  Expect.equals("c.d2", libraryId);
}
