// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constantPattern ::= booleanLiteral
///                   | nullLiteral
///                   | '-'? numericLiteral
///                   | stringLiteral
///                   | symbolLiteral
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
/// since they aren't ambiguous. We also allow unary - expressions on numeric
/// literals since users think of -2 as a single literal and not the literal 2
/// with a unary - applied to it (which is how the language views it).
///
/// @description Check booleans, numbers and strings in constant patterns. Test
/// switch statement
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String testBool(bool value) {
  switch (value) {
    case true:
      return "true";
    case false:
      return "false";
    default:
      return "default";
  }
}

String testNum(num value) {
  switch (value) {
    case 0:
      return "zero";
    case 3.14: // Now we are allowed to use double in a switch
      return "pi";
    case 42:
      return "answer";
    case -1:
      return "negative";
    case -3.14:
      return "negative-pi";
    case 0x1FFFFFFFFFFFFF:
      return "max_int";
    default:
      return "default";
  }
}

String testString(String value) {
  switch (value) {
    case "0":
      return "zero";
    case "3.14":
      return "pi";
    case "42":
      return "answer";
    case "":
      return "empty";
    default:
      return "default";
  }
}

main() {
  Expect.equals("true", testBool(true));
  Expect.equals("false", testBool(false));

  Expect.equals("zero", testNum(0));
  Expect.equals("zero", testNum(0.0));
  Expect.equals("pi", testNum(3.14));
  Expect.equals("answer", testNum(42));
  Expect.equals("negative", testNum(-1));
  Expect.equals("negative-pi", testNum(-3.14));
  Expect.equals("max_int", testNum(9007199254740991));
  Expect.equals("default", testNum(1));

  Expect.equals("zero", testString("0"));
  Expect.equals("pi", testString("3.14"));
  Expect.equals("answer", testString("42"));
  Expect.equals("empty", testString(""));
  Expect.equals("default", testString("Lily was here"));
}
