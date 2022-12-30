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
/// @description Check enums with a library prefix in constant patterns. Test
/// switch statements
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart" as p;
import "../../Utils/expect.dart";

void test(p.Color value) {
  switch (value) {
    case p.Color.white:
      Expect.equals(p.Color.white, value);
      break;
    case p.Color.red:
      Expect.equals(p.Color.red, value);
      break;
    case p.Color.yellow:
      Expect.equals(p.Color.yellow, value);
      break;
    case p.Color.blue:
      Expect.equals(p.Color.blue, value);
      break;
    case p.Color.black:
      Expect.equals(p.Color.black, value);
      break;
    default:
      Expect.fail("No such color found");
  }
}

main() {
  test(p.Color.white);
  test(p.Color.red);
  test(p.Color.yellow);
  test(p.Color.blue);
  test(p.Color.black);
}
