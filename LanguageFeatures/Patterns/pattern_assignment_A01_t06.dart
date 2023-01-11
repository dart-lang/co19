// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A pattern on the left side of an assignment expression is used to
/// destructure the assigned value. We extend expression:
///
/// expression        ::= patternAssignment
///                     | // Existing productions...
///
/// patternAssignment ::= outerPattern '=' expression
///
/// This syntax allows chaining pattern assignments and mixing them with other
/// assignments, but does not allow patterns to the left of a compound
/// assignment operator.
///
/// @description Check that it is a compile-time error if an object pattern in a
/// pattern assignment declares a variable that already exists
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  int areaAsInt = 1, sizeAsInt = 1;
  var Square(:areaAsInt) = Square(1);
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var Square(: int sizeAsInt) = Square(2);
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified}
}
