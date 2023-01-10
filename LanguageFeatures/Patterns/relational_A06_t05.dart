// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion relationalPattern ::=
///   ( equalityOperator | relationalOperator) relationalExpression
///
/// A relational pattern lets you compare the matched value to a given constant
/// using any of the equality or relational operators: ==, !=, <, >, <=, and >=.
/// The pattern matches when calling the appropriate operator on the matched
/// value with the constant as an argument returns true. It is a compile-time
/// error if relationalExpression is not a valid constant expression.
///
/// @description Checks the case when user-defined class with custom relational
/// operators is used in a relational pattern. Test if-case statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  final int value;
  const C(this.value);

  bool operator <(C other) => this.value < other.value;
  bool operator >(C other) => this.value > other.value;
  bool operator <=(C other) => this.value <= other.value;
  bool operator >=(C other) => this.value >= other.value;
  @override
  bool operator ==(Object other) => this.value == (other as C).value;
}

void test1(C c, String expected) {
  if (c case < const C(0)) {
    Expect.equals("negative", expected);
  } else if (c case == const C(0)) {
    Expect.equals("zero", expected);
  } else if (c case > const C(0)) {
    Expect.equals("positive", expected);
  } else {
    Expect.fail("One of the cases above should match");
  }
}

void test2(C c, String expected) {
  if (c case != const C(0)) {
    Expect.equals("non-zero", expected);
  } else if (c case == const C(0)) {
    Expect.equals("zero", expected);
  } else {
    Expect.fail("One of the cases above should match");
  }
}

void test3(C c, String expected) {
  if (c case >= const C(0)) {
    Expect.equals("zero or positive", expected);
  } else if (c case <= const C(-1)) {
    Expect.equals("negative", expected);
  } else {
    Expect.fail("One of the cases above should match");
  }
}

main() {
  test1(C(-1), "negative");
  test1(C(42), "positive");
  test1(C(0), "zero");
  test2(C(3), "non-zero");
  test2(C(0), "zero");
  test3(C(0), "zero or positive");
  test3(C(-1), "negative");
  test3(C(-100), "negative");
  test3(C(1), "zero or positive");
  test3(C(42), "zero or positive");
}
