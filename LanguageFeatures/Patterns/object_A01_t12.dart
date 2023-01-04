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
/// @description Checks an object pattern with an object subpattern in a
/// declaration context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var Square(area: Unit(value: a1)) = Square(2);
  Expect.equals(4, a1);

  final Square(area: Unit(value: b1)) = Square(2);
  Expect.equals(4, b1);

  var Square(area: Unit(value: double c1)) = Square(2);
  Expect.equals(4, c1);

  final Square(area: Unit(value: double d1)) = Square(2);
  Expect.equals(4, d1);

  var Square(area: Unit(value: _)) = Square(2);
  final Square(area: Unit(value: _)) = Square(2);
  var Square(area: Unit(value: double _)) = Square(2);
  final Square(area: Unit(value: double _)) = Square(2);
}
