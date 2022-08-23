// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression is a fragment of Dart code that can be evaluated at
/// run time
/// ...
///  <expression> ::= <assignableExpression> <assignmentOperator> <expression>
/// | <conditionalExpression>
/// | <cascade>
/// | <throwExpression>
/// <expressionWithoutCascade> ::=
/// <assignableExpression> <assignmentOperator> <expressionWithoutCascade>
/// | <conditionalExpression>
/// | <throwExpressionWithoutCascade>
/// <expressionList> ::= <expression> (‘,’ <expression>)*
/// <primary> ::= <thisExpression>
/// | super <unconditionalAssignableSelector>
/// | super <argumentPart>
/// | <functionExpression>
/// | <literal>
/// | <identifier>
/// | <newExpression>
/// | <constObjectExpression>
/// | <constructorInvocation>
/// | ‘(’ <expression> ‘)’
/// <literal> ::= <nullLiteral>
/// | <booleanLiteral>
/// | <numericLiteral>
/// | <stringLiteral>
/// | <symbolLiteral>
/// | <listLiteral>
/// | <setOrMapLiteral>
/// @description Checks that `super` without selector or argument part cannot be
/// used as an expression
/// @author sgrekhov22@gmail.com
/// @issue 43168

class C {
  foo() {
    print(super);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  C().foo();
}
