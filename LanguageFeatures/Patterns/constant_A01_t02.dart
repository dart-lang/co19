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
/// @description Check [Symbol] in a constant patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

void test(Symbol value) {
  switch (value) {
    case #+:
      Expect.equals(Symbol("+"), value);
      break;
    case #[]=:
      Expect.equals(Symbol("[]="), value);
      break;
    case Symbol.empty:
      Expect.equals(Symbol(""), value);
      break;
    case Symbol.unaryMinus:
      Expect.equals(Symbol("unary-"), value);
      break;
    case #foo:
      Expect.equals(Symbol("foo"), value);
      break;
    default:
      Expect.fail("No symbols matched");
  }
}

main() {
  test(Symbol("+"));
  test(Symbol("[]="));
  test(Symbol(""));
  test(Symbol("unary-"));
  test(Symbol("foo"));
}
