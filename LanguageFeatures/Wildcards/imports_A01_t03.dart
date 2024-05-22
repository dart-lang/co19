// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Import prefixes named `_` are non-binding and will provide access
/// to the extensions in that library.
///
/// @description Checks that it is a compile-time error to reference a library
/// prefix named `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import 'imports_lib1.dart' as _;

main() {
  print(_.theAnswer);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
