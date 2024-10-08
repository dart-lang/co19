// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We add a new rule and hang it off the existing uri rule already
/// used by import and export directives:
///
/// uri               ::= stringLiteral | packagePath
/// packagePath       ::= pathSegment ( '/' pathSegment )*
/// pathSegment       ::= segmentComponent ( '.' segmentComponent )*
/// segmentComponent  ::= IDENTIFIER
///                     | RESERVED_WORD
///                     | BUILT_IN_IDENTIFIER
///                     | OTHER_IDENTIFIER
///
/// @description Checks that it is a syntax error if a `.` is encountered when a
/// `packagePath` is expected. Ditto if a `;` is encountered when a
/// `segmentComponent` is expected. Ditto if a `.` is encountered when a
/// `pathSegment` is expected.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import ./test.package1;
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test.package1/a/c.d.e.;
//     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

import test_package2/a/../a/b;
//     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
