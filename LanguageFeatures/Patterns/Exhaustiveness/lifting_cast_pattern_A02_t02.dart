// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Cast pattern:
/// ...
/// Let S be the lifted space union of the cast's subpattern in context C.
/// i. If C is a subset (see below about type subsetting) of S then the result
///   spaces is the lifted space union of M.
/// ii. Otherwise, the result spaces is S plus the lifted space union of Null
///   when C is a non-nullable type, and spaces is S when C is potentially
///   nullable.
///
/// @description Check a lifted space of a cast pattern in case of a sealed type
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

sealed class A {}

class B extends A {}

class C extends A {}

test1(A a) {
  switch (a) {
    case B() as B:
      return 0;
  }
}

test2(A a) => switch (a) { C() as C => 0 };

main() {
  Expect.equals(0, test1(B()));
  Expect.throws(() {
    test1(C());
  });
  Expect.equals(0, test2(C()));
  Expect.throws(() {
    test2(B());
  });
}
