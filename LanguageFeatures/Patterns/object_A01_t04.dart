// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
///
/// An object pattern matches values of a given named type and then extracts
/// values from it by calling getters on the value. Object patterns let users
/// destructure data from arbitrary objects using the getters the object's class
/// already exposes.
///
/// @description Checks an object pattern with a logical-and subpattern in a
/// declaration context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var Square(areaAsInt: a1 && a2) = Square(2);
  Expect.equals(4, a1);
  Expect.equals(4, a2);

  final Square(areaAsInt: b1 && b2) = Square(2);
  Expect.equals(4, b1);
  Expect.equals(4, b2);

  var Square(areaAsInt: int c1 && num c2) = Square(2);
  Expect.equals(4, c1);
  Expect.equals(4, c2);

  final Square(areaAsInt: int d1 && num d2) = Square(2);
  Expect.equals(4, d1);
  Expect.equals(4, d2);

  var Square(areaAsInt: _ && _) = Square(2);
  final Square(areaAsInt: _ && _) = Square(2);
  var Square(areaAsInt: int _ && num _) = Square(2);
  final Square(areaAsInt: int _ && num _) = Square(2);
}
