// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Once the `packagePath` has been converted to a string, the
/// directive behaves exactly as if the user had written a `stringLiteral`
/// containing that same string.
///
/// @description Checks that it is a compile-time error to import a file from a
/// package root directory.
///
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import test.package1/dummy;
//     ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test.package1.dummy;
//     ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test_package2/dummy;
//     ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test_package2.dummy;
//     ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
