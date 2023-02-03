// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
/// ...
/// As with record patterns, the getter name can be omitted and inferred from
/// the variable pattern in the field subpattern which may be wrapped in a unary
/// pattern
///
/// @description Check that it is a compile-time error if an object pattern with
/// the omitted getter name in a declaration context declares a variable that
/// already exists
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
// [cfe] unspecified
}
