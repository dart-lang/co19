// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Cast pattern:
/// The space union spaces for a cast pattern with cast type C is a union of:
/// - The lifted space union of the cast's subpattern in context C.
/// - For each space E in the expanded spaces of M:
///   a. If E is not a subset of C and C is not a subset of M, then the lifted
///   space union of E.
///
/// @description Check a lifted space of a cast pattern in case of a sealed type
/// @author sgrekhov22@gmail.com
/// @issue 51877

// SharedOptions=--enable-experiment=patterns,class-modifiers

import "../../../Utils/expect.dart";

sealed class A {
  final int field;
  A(this.field);
}
class B extends A {
  B(int field) : super(field);
}
class C extends A {
  C(int field) : super(field);
}

test1(A a) {
  switch (a) {
    case C(field: 0) as C:
      return 0;
    case C _:
      return 1;
  }
}

test2(A a) => switch (a) {
  C(field: 0) as C => 0,
  C _ => 1
};

main() {
  Expect.equals(0, test1(C(0)));
  Expect.equals(1, test1(C(1)));
  Expect.throws(() {
    test1(B(0));
  });
  Expect.equals(0, test2(C(0)));
  Expect.equals(1, test2(C(1)));
  Expect.throws(() {
    test2(B(0));
  });
}
