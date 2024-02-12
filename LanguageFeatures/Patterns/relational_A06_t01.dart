// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion relationalPattern ::=
///   ( equalityOperator | relationalOperator) bitwiseOrExpression
///
/// A relational pattern lets you compare the matched value to a given constant
/// using any of the equality or relational operators: ==, !=, <, >, <=, and >=.
/// The pattern matches when calling the appropriate operator on the matched
/// value with the constant as an argument returns true.
///
/// It is a compile-time error if bitwiseOrExpression is not a valid constant
/// expression.
///
/// @description Checks the case when user-defined class with custom relational
/// operators is used in a relational pattern. Test switch expression
/// @author sgrekhov22@gmail.com

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
  @override
  int get hashCode => throw "Never used";
}

String test1(C c) {
  return switch (c) {
    < const C(0) => "negative",
    >= const C(0) => "positive",
    _ => "Impossible!"
  };
}

String test2(C c) {
  return switch (c) {
    >= const C(0) => "positive",
    < const C(0) => "negative",
    _ => "Impossible!"
  };
}

String test3(C c) {
  return switch (c) {
    == const C(0) => "zero",
    != const C(0) => "non-zero",
    _ => "Impossible!"
  };
}

main() {
  Expect.equals("negative", test1(C(-1)));
  Expect.equals("positive", test1(C(0)));
  Expect.equals("positive", test1(C(1)));
  Expect.equals("negative", test2(C(-1)));
  Expect.equals("positive", test2(C(0)));
  Expect.equals("positive", test2(C(1)));
  Expect.equals("zero", test3(C(0)));
  Expect.equals("non-zero", test3(C(42)));
}
