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
  Expect.equals(42, theAnswer);
  Expect.equals(1, one);
}
