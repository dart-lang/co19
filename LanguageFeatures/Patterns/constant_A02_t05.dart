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
/// @description Check static constants on classes in constant patterns. Test
/// if-case statement
/// @author sgrekhov22@gmail.com

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
  if (value case C.True) {
    return "true";
  } else if (value case C.False) {
    return "false";
  } else {
    return "default";
  }
}

String testNum(num value) {
  if (value case C.Zero) {
    return "zero";
  } else if (value case C.Pi) {
    return "pi";
  } else if (value case C.Answer) {
    return "answer";
  } else if (value case C.Negative) {
    return "negative";
  } else if (value case C.NegativePi) {
    return "negative-pi";
  } else if (value case C.MaxJSInt) {
    return "max_int";
  } else {
    return "default";
  }
}

String testString(String value) {
  if (value case C.Melody) {
    return "Melody";
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
  Expect.equals("negative", testNum(-1));
  Expect.equals("negative-pi", testNum(-3.14));
  Expect.equals("max_int", testNum(9007199254740991));
  Expect.equals("default", testNum(1));

  Expect.equals("Melody", testString("Lily was here"));
  Expect.equals("default", testString(""));
}
