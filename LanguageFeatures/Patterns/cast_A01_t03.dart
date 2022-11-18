// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion castPattern ::= primaryPattern 'as' type
///
/// A cast pattern is similar to an extractor pattern in that it checks the
/// matched value against a given type. But where an extractor pattern is
/// refuted if the value doesn't have that type, a cast pattern throws. Like the
/// null-assert pattern, this lets you forcibly assert the expected type of some
/// destructured value.
///
/// @description Check some valid cast patterns in a if-case
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

const Object zero = 0;

main() {
  int i = 1;
  if (i case > zero as int) {
    Expect.equals(1, i);
  } else {
    Expect.fail("Shouldn't be here");
  }
  bool visited = false;
  if (i case _ as int) {
    visited = true;
  } else {
    Expect.fail("Shouldn't be here");
  }
  Expect.isTrue(visited);
}
