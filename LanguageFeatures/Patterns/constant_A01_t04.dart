// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constantPattern ::= booleanLiteral
///                   | nullLiteral
///                   | numericLiteral
///                   | stringLiteral
///                   | identifier
///                   | qualifiedName
///                   | constObjectExpression
///                   | 'const' typeArguments? '[' elements? ']'
///                   | 'const' typeArguments? '{' elements? '}'
///                   | 'const' '(' expression ')'
///
/// A constant pattern determines if the matched value is equal to the
/// constant's value. We don't allow all expressions here because many
/// expression forms syntactically overlap other kinds of patterns. We avoid
/// ambiguity while supporting terse forms of the most common constant
/// expressions like so:
///
/// Simple "primitive" literals like Booleans and numbers are valid patterns
/// since they aren't ambiguous.
///
/// @description Check that [Symbol] can be used in constant patterns.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String test1(Symbol value) {
  switch (value) {
    case #+:
      return "+";
    case #foo:
      return "foo";
    case Symbol.unaryMinus:
      return "-";
    case const Symbol("bar"):
      return "bar";
    default:
      return "default";
  }
}

String test2(Symbol value) {
  return switch (value) {
    #+ => "+",
    #foo => "foo",
    Symbol.unaryMinus => "-",
    const Symbol("bar") => "bar",
    _ => "default"
  };
}

String test3(Symbol value) {
  if (value case #+) {
    return "+";
  }
  if (value case #foo) {
    return "foo";
  }
  if (value case Symbol.unaryMinus) {
    return "-";
  }
  if (value case const Symbol("bar")) {
    return "bar";
  }
  return "default";
}

main() {
  if (!isMinified) {
    Expect.equals("+", test1(Symbol("+")));
    Expect.equals("foo", test1(Symbol("foo")));
    Expect.equals("-", test1(Symbol("unary-")));
    Expect.equals("bar", test1(Symbol("bar")));
    Expect.equals("+", test2(Symbol("+")));
    Expect.equals("foo", test2(Symbol("foo")));
    Expect.equals("-", test2(Symbol("unary-")));
    Expect.equals("bar", test2(Symbol("bar")));
    Expect.equals("+", test3(Symbol("+")));
    Expect.equals("foo", test3(Symbol("foo")));
    Expect.equals("-", test3(Symbol("unary-")));
    Expect.equals("bar", test3(Symbol("bar")));
  }
}
