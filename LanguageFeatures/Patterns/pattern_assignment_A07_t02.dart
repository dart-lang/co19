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
/// ...
/// It is a compile-time error if:
/// ...
/// The matched value type for a variable or cast pattern is not assignable to
/// the corresponding variable's type.
///
/// @description Check that it is a runtime error if wrong value is assigned
/// in a cast pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  num d = 3.14;
  Expect.throws(() {
    (d as double) = "one";
  });
}
