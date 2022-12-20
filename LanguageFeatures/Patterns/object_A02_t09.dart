// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
/// ...
/// As with record patterns, the getter name can be omitted and inferred from
/// the variable pattern in the field subpattern which may be wrapped in a unary
/// pattern
///
/// @description Checks that an object pattern with omitted getter name and a
/// parenthesized subpattern in a declaration context produces a compile-time
/// error
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";

main() {
  var Square(:(areaAsInt)) = Square(1);
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(:(sizeAsInt)) = Square(2);
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  var Square(: (double areaAsDouble)) = Square(3);
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(: (double sizeAsDouble)) = Square(4);
//               ^
// [analyzer] unspecified
// [cfe] unspecified

}
