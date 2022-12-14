// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion nullAssertPattern ::= primaryPattern '!'
///
/// A null-assert pattern is similar to a null-check pattern in that it permits
/// non-null values to flow through. But a null-assert throws if the matched
/// value is null. It lets you forcibly assert that you know a value shouldn't
/// be null, much like the corresponding ! null-assert expression.
///
/// @description Check null-assert pattern in an if-case statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

test(List<String?> list, [bool testVisited = false]) {
  bool visited = false;
  if (list case ['name', var name!]) {
    name.expectStaticType<Exactly<String>>();
    name.substring(0);
  }
  if (list case ['answer', _!]) {
    visited = true;
  } else {
    Expect.fail("Wrong branch of code");
  }
  if (testVisited) {
    Expect.isTrue(visited);
  }
}

main() {
  test(['name', 'Lily']);
  test(['answer', '42'], true);
}
