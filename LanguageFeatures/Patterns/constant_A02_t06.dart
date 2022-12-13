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
/// @description Check static constants on classes in constant patterns. Test
/// switch expressions
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  static const Zero = 0;
  static const Pi = 3.14;
  static const Answer = 42;
  static const Negative = -1;
  static const NegativePi = -3.14;
  static const MaxJSInt = 0x1FFFFFFFFFFFFF;
  static const Melody = "Lily was here";
  static const True = true;
  static const False = false;
}

String testBool(bool value) {
  return switch (value) {
    C.True => "true",
    C.False => "false"
  };
}

String testNum(num value) {
  return switch (value) {
    C.Zero => "zero",
    C.Pi => "pi",
    C.Answer => "answer",
    C.Negative => "negative",
    C.NegativePi => "negative-pi",
    C.MaxJSInt => "max_int",
    _ => "default"
  };
}

String testString(String value) {
  return switch (value) {
    C.Melody => "Melody",
    _ => "default"
  };
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

  Expect.equals("Melody", testString("Lily was here"));
  Expect.equals("default", testString(""));
}
