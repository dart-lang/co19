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
/// @description Check a lifted space of a cast pattern in case of a not sealed
/// type
/// @author sgrekhov22@gmail.com
/// @issue 54460

class A {
  final int field;
  A(this.field);
}

class B extends A {
  B(int field) : super(field);
}

class C extends A {
  C(int field) : super(field);
}

extension type AET1(A _) {}
extension type AET2(A _) implements A {}
extension type BET1(B _) {}
extension type BET2(B _) implements B {}
extension type CET1(C _) {}
extension type CET2(C _) implements C {}

int test1_1(AET1 a) {
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (a) {
    case C(field: 0) as C:
      return 0;
    case C _:
      return 1;
  }
}

int test1_2(AET2 a) {
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (a) {
    case C(field: 0) as C:
      return 0;
    case C _:
      return 1;
  }
}

// The corresponding switch statement above will not complete normally in this
// case (which means that there is no "returns null" error), but this switch
// expression is an error because it can not be recognized as exhaustive. This
// discrepancy is expected. For more details see
// https://github.com/dart-lang/sdk/issues/51986#issuecomment-1864237801
int test1_3(AET1 a) => switch (a) {
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    C(field: 0) as C => 0,
    C _ => 1
  };

int test1_4(AET2 a) => switch (a) {
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    C(field: 0) as C => 0,
    C _ => 1
  };

int test2_1(A a) { // Ok
  switch (a) {
    case C(field: 0) as CET1:
      return 0;
    case CET1 _:
      return 1;
  }
}

int test2_2(A a) { // Ok
  switch (a) {
    case CET2(field: 0) as CET2:
      return 0;
    case C _:
      return 1;
  }
}

int test2_3(A a) => switch (a) {
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    C(field: 0) as CET1 => 0,
    C _ => 1
  };

int test2_4(A a) => switch (a) {
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    CET2(field: 0) as CET2 => 0,
    CET2 _ => 1
  };

main() {
  test1_1(AET1(C(0)));
  test1_2(AET2(C(0)));
  test1_3(AET1(C(0)));
  test1_4(AET2(C(0)));

  test2_1(C(0));
  test2_2(C(0));
  test2_3(C(0));
  test2_4(C(0));
}
