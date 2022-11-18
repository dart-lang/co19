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
/// @description Check that cast pattern throws if the value doesn't have an
/// expected type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

bool isOdd1(Object o) =>
  switch (o) {
    case  var v as int => v.isOdd;
    default => false;
  };

bool isOdd2(Object o) {
  switch (o) {
    case var v as int:
      return v.isOdd;
    default:
      return false;
  };
}

bool isOdd3(Object o) {
  if (o case var v as int) {
    return v.isOdd;
  }
  return false;
}

main() {
  Expect.isTrue(isOdd1(1));
  Expect.isFalse(isOdd1(2));
  Expect.throws(() {
    isOdd1("1");
  });

  Expect.isTrue(isOdd2(1));
  Expect.isFalse(isOdd2(2));
  Expect.throws(() {
    isOdd2("1");
  });

  Expect.isTrue(isOdd3(1));
  Expect.isFalse(isOdd3(2));
  Expect.throws(() {
    isOdd3("1");
  });
}
