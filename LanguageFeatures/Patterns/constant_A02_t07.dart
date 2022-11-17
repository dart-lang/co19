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
/// ...
/// Named constants are also allowed because they aren't ambiguous. That
/// includes simple identifiers like someConstant, prefixed constants like
/// some_library.aConstant, static constants on classes like
/// SomeClass.aConstant, and prefixed static constants like
/// some_library.SomeClass.aConstant. Simple identifiers would be ambiguous with
/// variable patterns that aren't marked with var, final, or a type, but
/// unmarked variable patterns are only allowed in irrefutable contexts where
/// constant patterns are prohibited.
///
/// @description Check static constants on classes with a library prefix in
/// constant patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart" as p;
import "../../Utils/expect.dart";

String testBool(bool value) {
  switch (value) {
    case p.C0.True:
      return "true";
    case p.C0.False:
      return "false";
    default:
      return "default";
  }
}

String testNum(num value) {
  switch (value) {
    case p.C0.Zero:
      return "zero";
    case p.C0.Pi:
      return "pi";
    case p.C0.Answer:
      return "answer";
    case p.C0.MaxInt:
      return "max_int";
    default:
      return "default";
  }
}

String testString(String value) {
  switch (value) {
    case p.C0.Melody:
      return "Melody";
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
  Expect.equals("max_int", testNum(9223372036854775807));
  Expect.equals("default", testNum(1));

  Expect.equals("Melody", testString("Lily was here"));
  Expect.equals("default", testString(""));
}
