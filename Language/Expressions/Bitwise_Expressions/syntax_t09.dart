// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Bitwise expressions invoke the bitwise operators on objects.
/// bitwiseOrExpression:
///   bitwiseXorExpression ('|' bitwiseXorExpression)* |
///   super ('|' bitwiseXorExpression)+
/// ;
/// bitwiseXorExpression:
///   bitwiseAndExpression ('^' bitwiseAndExpression)* |
///   super ('^' bitwiseAndExpression)+
/// ;
/// bitwiseAndExpression:
///   shiftExpression ('&' shiftExpression)* |
///   super ('&' shiftExpression)+
/// ;
/// bitwiseOperator:
///   '&' |
///   '^' |
///   '|'
/// ;
/// A bitwise expression is either a shift expression, or an invocation of a
/// bitwise operator on either super or an expression e1, with argument e2.
/// @description Checks that two operators & can't placed one after another.
/// @author msyabro


main() {
  try {
    1 & & 2;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (e) {}
}

