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
/// @description Check enums in constant patterns. Test switch expressions
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

enum Color {
  white,
  red,
  yellow,
  blue,
  black;
}

String test(Color value) {
  return switch (value) {
    Color.white => "white",
    Color.red => "red",
    Color.yellow => "yellow",
    Color.blue => "blue",
    Color.black => "black"
  };
}

main() {
  Expect.equals("white", test(Color.white));
  Expect.equals("red", test(Color.red));
  Expect.equals("yellow", test(Color.yellow));
  Expect.equals("blue", test(Color.blue));
  Expect.equals("black", test(Color.black));
}
