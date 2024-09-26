// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All of the tokens in the path must be directly adjacent with no
/// whitespace, newlines, or comments between them.
///
/// @description Checks that it is a compile-time error if an import path
/// contains any comments.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import test.package1/* comment *//dotted.name1;
//     ^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test_package2/dotted/* comment */.name2;
//     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
