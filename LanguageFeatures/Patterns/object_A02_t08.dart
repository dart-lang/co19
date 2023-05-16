// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
/// ...
/// As with record patterns, the getter name can be omitted and inferred from
/// the variable pattern in the field subpattern which may be wrapped in a unary
/// pattern
///
/// @description Checks an object pattern with omitted getter name and a
/// variable subpattern in a declaration context
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var Square(:areaAsInt) = Square(1);
  Expect.equals(1, areaAsInt);

  final Square(:sizeAsInt) = Square(2);
  Expect.equals(2, sizeAsInt);

  var Square(: double areaAsDouble) = Square(3);
  Expect.equals(9, areaAsDouble);

  final Square(: double sizeAsDouble) = Square(4);
  Expect.equals(4, sizeAsDouble);
}
