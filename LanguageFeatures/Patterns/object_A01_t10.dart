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
/// @description Checks an object pattern with a map subpattern in a
/// declaration context
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var Square(areaAsMap: {"area": a1}) = Square(2);
  Expect.equals(4, a1);

  final Square(areaAsMap: {"area": b1}) = Square(2);
  Expect.equals(4, b1);

  var Square(areaAsMap: <String, num>{"area": num c1}) = Square(2);
  Expect.equals(4, c1);

  final Square(areaAsMap: <String, num>{"area": num d1}) = Square(2);
  Expect.equals(4, d1);

  var Square(areaAsMap: {"area": _}) = Square(2);
  final Square(areaAsMap: {"area": _}) = Square(2);
  var Square(areaAsMap: {"area": num _}) = Square(2);
  final Square(areaAsMap: {"area": num _}) = Square(2);
}
