// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Import prefixes named `_` are non-binding and will provide access
/// to the extensions in that library.
///
/// @description Checks that it's not an error to import more than one library
/// with the prefix `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import 'imports_lib1.dart' as _;
import 'imports_lib2.dart' as _;
import '../../Utils/expect.dart';

main() {
  main() {
    Expect.equals(2, "x".doubleLength);
    Expect.equals(3, "x".tripleLength);
  }
}
