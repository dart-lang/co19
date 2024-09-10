// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any Dart file can contain an `export` directive. It makes no
/// difference which file an `export` is in, its declarations (filtered by any
/// `hide` or `show` modifiers) are added to the library’s single export scope,
/// along with those of any other `exports` in the library and the non-private
/// declarations of the library itself.
///
/// @description Check that export directive contained in a part files of a
/// library is added to the library's export scope.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

import 'export_A01_t01_lib.dart';
import '../../Utils/expect.dart';

main() {
  // From parts_lib.dart
  Expect.equals("libVar", libVar);
  Expect.equals("libGetter", libGetter);
  libSetter = "x";
  Expect.equals("libFunc", libFunc);
  Expect.equals("LibClass", LibClass.id);
  Expect.equals("LibMixin", LibMixin.id);
  Expect.equals("LibEnum", LibEnum.id);
  Expect.equals("LibExt", LibExt.id);
  Expect.equals("LibET", LibET.id);
  // From scope_lib2.dart
  Expect.equals("scope_lib2", libId);
  Expect.equals("scope_lib2 lib2Func", lib2Func());
}
