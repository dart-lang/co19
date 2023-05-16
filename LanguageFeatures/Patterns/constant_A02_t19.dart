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
/// @description Check that it is a compile-time error if named numerical
/// constant is prefixed by '-'
/// @author sgrekhov22@gmail.com

const Zero = 0;
const Pi = 3.14;
const Answer = 42;
const Negative = -1;
const NegativePi = -3.14;
const MaxJSInt = 0x1FFFFFFFFFFFFF;

String test1(num value) {
  switch (value) {
    case -Zero:
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "zero";
    case -Pi:
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "pi";
    case -Answer:
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "answer";
    case -Negative:
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "negative";
    case -NegativePi:
//       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "negative-pi";
    case -MaxJSInt:
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "max_int";
    default:
      return "default";
  }
}

String test2(num value) {
  if (value case -Zero) {
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "zero";
  }
  if (value case -Pi) {
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "pi";
  }
  if (value case -Answer) {
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "answer";
  }
  if (value case -Negative) {
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "negative";
  }
  if (value case -NegativePi) {
//               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "negative-pi";
  }
  if (value case -MaxJSInt) {
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "max_int";
  }
  return "default";
}

String test3(num value) {
  return switch (value) {
    -Zero => "zero",
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    -Pi => "pi",
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
    -Answer => "answer",
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    -Negative => "negative",
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    -NegativePi => "negative-pi",
//  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    -MaxJSInt => "max_int",
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

main() {
  test1(0);
  test2(0);
  test3(0);
}
