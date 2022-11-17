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
/// @description Check booleans, numbers and strings in constant patterns.
/// Test if-case statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String testBool(bool value) {
  if (value case true) {
    return "true";
  } else if (value case false) {
    return "false";
  } else {
    return "default";
  }
}

String testNum(num value) {
  if (value case 0) {
    return "zero";
  } else if (value case 3.14) {
    return "pi";
  } else if (value case 42) {
    return "answer";
  } else if (value case 0x7FFFFFFFFFFFFFFF) {
    return "max_int";
  } else {
    return "default";
  }
}

String testString(String value) {
  if (value case "0") {
    return "zero";
  } else if (value case "3.14") {
    return "pi";
  } else if (value case "42") {
    return "answer";
  } else if (value case "") {
    return "empty";
  } else {
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
  Expect.equals("max_int", testNum(9223372036854775807));
  Expect.equals("default", testNum(1));

  Expect.equals("zero", testString("0"));
  Expect.equals("pi", testString("3.14"));
  Expect.equals("answer", testString("42"));
  Expect.equals("empty", testString(""));
  Expect.equals("default", testString("Lily was here"));
}
