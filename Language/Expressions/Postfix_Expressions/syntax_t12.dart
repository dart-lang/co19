// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Postfix expressions invoke the postfix operators on objects.
/// postfixExpression:
///   assignableExpression postfixOperator |
///   primary (selector* | (‘#’ ( (identifier ‘=’?) | operator)))
/// ;
/// postfixOperator:
///   incrementOperator
/// ;
/// selector:
///   assignableSelector |
///   arguments
/// ;
/// incrementOperator:
///   '++' |
///   '--'
/// ;
/// A postfix expression is either a primary expression, a function, method or
/// getter invocation, or an invocation of a postfix operator on an expression e.
/// @description Checks that trying to use map with postfixOperator causes a
/// compile error.
/// `Operator []` of [Map] returns a nullable type, because it returns [null]
/// when the given argument isn't one of the keys of the map. That's why this is
/// a compile error here. Operator ?++ is not supported for Maps currently.
/// @author iarkh


main() {
  var a = {1: 1, 2: 2, 3: 3}[1]++;
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
}
