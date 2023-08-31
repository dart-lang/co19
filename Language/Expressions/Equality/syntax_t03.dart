// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Equality expressions test objects for equality.
/// equalityExpression:
///   relationalExpression (equalityOperator relationalExpression)? |
///   super equalityOperator relationalExpression
/// ;
/// equalityOperator:
///   '==' |
///   '!='
/// ;
/// An equality expression is either a relational expression, or an invocation of
/// an equality operator on either super or an expression e1, with argument e2.
/// @description Checks that an equality expression can't start with operator ==.
/// @author msyabro


main() {
  try {
    == 1;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (e) {}
}
