// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A cascaded method invocation has the form e..suffix where e is
/// an expression and suffix is a sequence of operator, method, getter or
/// setter invocations.
/// cascadeSection:
///   '..'  (cascadeSelector arguments*)(assignableSelector arguments*)*
/// (assignmentOperator expressionWithoutCascade)?
/// ;
/// cascadeSelector:
///   '[' expression ']' |
///   identifier
/// ;
/// @description Checks that it is a compile-time error if suffix is a map
/// literal.
/// @author msyabro


class C {
  m1() {}
}

main() {
  var o = new C();
  o..{'k1': 1, 'k2': 2};
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

