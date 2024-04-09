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
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case B() as C:
      return 0;
  }
}

int testStatement1_2(AET2 a) {
  switch (a) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case B() as C:
      return 0;
  }
}

int testExpression1_1(AET1 a) => switch (a) { B() as C => 0 };
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

int testExpression1_2(AET2 a) => switch (a) { B() as C => 0 };
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

int testStatement2_1(A a) {
  switch (a) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case B() as CET1:
      return 0;
  }
}

int testStatement2_2(A a) {
  switch (a) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case B() as CET2:
      return 0;
  }
}

int testExpression2_1(A a) => switch (a) { B() as CET1 => 0 };
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

int testExpression2_2(A a) => switch (a) { BET2() as C => 0 };
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

int testStatement3_1(AET1 a) {
  switch (a) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case BET1() as CET1:
      return 0;
  }
}

int testStatement3_2(AET2 a) {
  switch (a) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case BET2() as CET2:
      return 0;
  }
}

int testExpression3_1(AET1 a) => switch (a) { BET1() as CET1 => 0 };
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

int testExpression3_2(AET2 a) => switch (a) { BET2() as CET2 => 0 };
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(testStatement1_1);
  print(testStatement1_2);
  print(testExpression1_1);
  print(testExpression1_2);

  print(testStatement2_1);
  print(testStatement2_2);
  print(testExpression2_1);
  print(testExpression2_2);

  print(testStatement3_1);
  print(testStatement3_2);
  print(testExpression3_1);
  print(testExpression3_2);
}
