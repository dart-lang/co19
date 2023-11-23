// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Shift expressions invoke the shift operators on objects.
/// shiftExpression:
///   additiveExpression (shiftOperator additiveExpression)* |
///   super (shiftOperator additiveExpression)+
/// ;
/// shiftOperator:
///   '<<' |
///   '>>' |
///   '>>>'
/// ;
/// A shift expression is either an additive expression, or an invocation
/// of a shift operator on either super or an expression e1, with argument e2.
/// @description Checks that a shift expression can't start with
/// the shift operator >>.
/// @author msyabro


main() {
  >> 2;
//^
// [analyzer] unspecified
// [cfe] unspecified
}
