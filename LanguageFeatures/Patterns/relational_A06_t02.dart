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
/// operators is used in a relational pattern. Test a relational subpattern in a
/// switch expression
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

String test(List<C> list) => switch (list) {
  [> C(0) && <= C(2)] => "case 1",
  [== C(42)] => "case 2",
  [>= C(10) && < C(20)] => "case 3",
  [!= C(100)] => "case 4",
  _ => "default"
};

main() {
  Expect.equals("case 1", test([C(1)]));
  Expect.equals("case 1", test([C(2)]));
  Expect.equals("case 2", test([C(42)]));
  Expect.equals("case 3", test([C(10)]));
  Expect.equals("case 3", test([C(11)]));
  Expect.equals("case 4", test([C(20)]));
  Expect.equals("default", test([C(100)]));
}
