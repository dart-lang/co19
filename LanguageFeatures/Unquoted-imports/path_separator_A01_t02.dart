// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instead of `.`, this proposal uses `/`. This is obviously a
/// natural path separator since it's the main path separator character used in
/// most operating systems and in URLs on the web. Also, it is already the path
/// separator character used inside Dart imports today.
///
/// @description Checks that it is a compile-time error to use `.` or `\` as a
/// path separator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import test_package2.dotted.name2;
//     ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test_package2\dotted.name2;
//     ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test_package2/a\b/c;
//     ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test_package2/a/b.c;
//     ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test_package2/a.b;
//     ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test_package2/a\b;
//     ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
