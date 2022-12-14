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
/// @description Check some valid cast patterns in a switch expressions and
/// statements
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

const Object zero = 0;

bool isZero(num i) {
  return switch (i) {
      zero as int => true,
      _ => false
  };
}

bool isInt(Object o) =>
  switch (o) {
    _ as int => true,
    _ => false
  };

main() {
  Expect.isTrue(isZero(0));
  Expect.isFalse(isZero(1));
  Expect.isFalse(isZero(-1));
  Expect.isTrue(isInt(42));
  Expect.throws(() {
    isInt("42");
  });

  int i = 1;
  switch (i) {
    case zero as int:
      Expect.equals(1, i);
      break;
    default:
      Expect.fail("Shouldn't be here");
  }
  Object j = 2;
  switch (j) {
    case var v as int:
      Expect.equals(2, v);
      break;
    default:
      Expect.fail("Shouldn't be here");
  }
}
