// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A pattern on the left side of an assignment expression is used to
/// destructure the assigned value. We extend expression:
///
/// expression        ::= patternAssignment
///                     | // Existing productions...
///
/// patternAssignment ::= outerPattern '=' expression
/// ...
/// In a pattern assignment, all variable patterns are interpreted as referring
/// to existing variables. You can't declare any new variables.
///
/// @description Check that it is a compile-time error if a pattern assignment
/// declares any variable. Test an object pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  int a = 3;
  Square(areaAsInt: var a, sizeAsInt: _) = Square(1);
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: int a, sizeAsInt: _) = Square(1);
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: final a, sizeAsInt: _) = Square(1);
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Square(areaAsInt: const a, sizeAsInt: _) = Square(1);
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: a, sizeAsInt: var b1) = Square(1);
//                                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: a, sizeAsInt: int b2) = Square(1);
//                                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: a, sizeAsInt: final b3) = Square(1);
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Square(areaAsInt: a, sizeAsInt: const b4) = Square(1);
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(:var areaAsInt) = Square(2);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  Square(:int sizeAsInt) = Square(2);
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  Square(:final sizeAsDouble) = Square(2);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Square(:const areaAsNullable) = Square(2);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var areaAsDouble = 3.14;
  Square(:var areaAsDouble) = Square(2);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  Square(:int areaAsDouble) = Square(2);
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  Square(:final areaAsDouble) = Square(2);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Square(:const areaAsDouble) = Square(2);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
