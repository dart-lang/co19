// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Relational expressions invoke the relational operators on objects.
/// relationalExpression:
///   bitwiseOrExpression (typeTest | typeCast | relationalOperator
/// bitwiseOrExpression)? |
///   super relationalOperator bitwiseOrExpression
/// ;
/// relationalOperator:
///   '>=' |
///   '>' |
///   '<=' |
///   '<'
/// ;
/// A relational expression is either a bitwise expression, or an invocation of
/// a relational operator on either super or an expression e1, with argument e2.
/// @description Checks that a reference to a class declaration cannot be used
/// as the second operand in a relational expression without a compile error.
/// @author msyabro
/// @reviewer kaigorodov


class A {}

main() {
  3 > A;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}
