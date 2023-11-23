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
/// null-assert subpattern in a declaration context
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  {
    var Square(:areaAsNullable!) = Square(1);
    Expect.equals(1, areaAsNullable);

    final Square(:sizeAsNullable!) = Square(2);
    Expect.equals(2, sizeAsNullable);
  }
  {
    var Square(:num? areaAsNullable!) = Square(1);
    Expect.equals(1, areaAsNullable);

    final Square(:num? sizeAsNullable!) = Square(2);
    Expect.equals(2, sizeAsNullable);
  }

  Expect.throws(() {
    var Square(:areaAsNull!) = Square(1);
  });
  Expect.throws(() {
    final Square(:areaAsNull!) = Square(1);
  });
  Expect.throws(() {
    var Square(:num? areaAsNull!) = Square(1);
  });
  Expect.throws(() {
    final Square(:num? areaAsNull!) = Square(1);
  });
}
