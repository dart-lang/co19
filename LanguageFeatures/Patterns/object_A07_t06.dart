// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
/// ...
/// It is a compile-time error if:
///
/// `typeNam`e does not refer to a type.
///
/// A type argument list is present and does not match the arity of the type of
/// `typeName`.
///
/// A `patternField` is of the form `pattern`. Positional fields aren't allowed.
///
/// Any two named fields have the same name. This applies to both explicit and
/// inferred field names.
///
/// It is a compile-time error if a name cannot be inferred for a named getter
/// pattern with the getter name omitted (see name inference below).
///
/// @description Check that wildcard `_` can be used in Object pattern in a
/// declaration context. Getter is called, but its value is ignored
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";
import "../../Utils/expect.dart";

String log = "";

void logger(String s) {
  log += s;
}

main() {
  var Square(area: _) = Square(2, logger);
  Expect.equals("Square.area", log);

  var Square(areaAsInt: int _) = Square(1);

  Expect.throws(() {
    var Square(areaAsInt: _ as String) = Square(1);
  });
}
