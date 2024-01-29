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

import "../../Utils/expect.dart";

sealed class A {}

class B extends A {}

class C extends A {}

extension type AET1(A _) {}
extension type AET2(A _) implements A {}
extension type BET1(B _) {}
extension type BET2(B _) implements B {}
extension type CET1(C _) {}
extension type CET2(C _) implements C {}

int testStatement1_1(AET1 a) {
  switch (a) {
    case B() as B:
      return 0;
  }
}

int testStatement1_2(AET2 a) {
  switch (a) {
    case B() as B:
      return 0;
  }
}

int testExpression1_1(AET1 a) => switch (a) { C() as C => 0 };

int testExpression1_2(AET2 a) => switch (a) { C() as C => 0 };

int testStatement2_1(A a) {
  switch (a) {
    case B() as BET1:
      return 0;
  }
}

int testStatement2_2(A a) {
  switch (a) {
    case B() as BET2:
      return 0;
  }
}

int testExpression2_1(A a) => switch (a) { C() as CET1 => 0 };

int testExpression2_2(A a) => switch (a) { C() as CET2 => 0 };

int testStatement3_1(AET1 a) {
  switch (a) {
    case BET1() as BET1:
      return 0;
  }
}

int testStatement3_2(AET2 a) {
  switch (a) {
    case BET2() as BET2:
      return 0;
  }
}

int testExpression3_1(AET1 a) => switch (a) { CET1() as CET1 => 0 };

int testExpression3_2(AET2 a) => switch (a) { CET2() as CET2 => 0 };

main() {
  Expect.equals(0, testStatement1_1(AET1(B())));
  Expect.equals(0, testExpression1_1(AET1(C())));
  Expect.throws(() {
    testStatement1_1(AET1(C()));
  });
  Expect.throws(() {
    testExpression1_1(AET1(B()));
  });
  Expect.equals(0, testStatement1_2(AET2(B())));
  Expect.equals(0, testExpression1_2(AET2(C())));
  Expect.throws(() {
    testStatement1_2(AET2(C()));
  });
  Expect.throws(() {
    testExpression1_2(AET2(B()));
  });

  Expect.equals(0, testStatement2_1(B()));
  Expect.equals(0, testExpression2_1(C()));
  Expect.throws(() {
    testStatement2_1(C());
  });
  Expect.throws(() {
    testExpression2_1(B());
  });
  Expect.equals(0, testStatement2_2(B()));
  Expect.equals(0, testExpression2_2(C()));
  Expect.throws(() {
    testStatement2_2(C());
  });
  Expect.throws(() {
    testExpression2_2(B());
  });

  Expect.equals(0, testStatement3_1(AET1(B())));
  Expect.equals(0, testExpression3_1(AET1(C())));
  Expect.throws(() {
    testStatement3_1(AET1(C()));
  });
  Expect.throws(() {
    testExpression3_1(AET1(B()));
  });
  Expect.equals(0, testStatement3_2(AET2(B())));
  Expect.equals(0, testExpression3_2(AET2(C())));
  Expect.throws(() {
    testStatement3_2(AET2(C()));
  });
  Expect.throws(() {
    testExpression3_2(AET2(B()));
  });
}
