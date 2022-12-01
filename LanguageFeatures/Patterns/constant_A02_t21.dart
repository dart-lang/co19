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
/// constant is prefixed by '-'. Test static constants
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

class C {
  static const Zero = 0;
  static const Pi = 3.14;
  static const Answer = 42;
  static const Negative = -1;
  static const NegativePi = -3.14;
  static const MaxJSInt = 0x1FFFFFFFFFFFFF;
}

String test1(num value) {
  switch (value) {
    case -C.Zero:
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "zero";
    case -C.Pi:
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "pi";
    case -C.Answer:
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "answer";
    case -C.Negative:
//       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "nagative";
    case -C.NegativePi:
//       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "nagative-pi";
    case -C.MaxJSInt:
//       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "max_int";
    default:
      return "default";
  }
}

String test2(num value) {
  if (value case -C.Zero) {
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "zero";
  }
  if (value case -C.Pi) {
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "pi";
  }
  if (value case -C.Answer) {
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "answer";
  }
  if (value case -C.Negative) {
//               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "nagative";
  }
  if (value case -C.NegativePi) {
//               ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "nagative-pi";
  }
  if (value case -C.MaxJSInt) {
//               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "max_int";
  }
  return "default";
}

String test3(num value) {
  return switch (value) {
    case -C.Zero => "zero";
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case -C.Pi => "pi";
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case -C.Answer => "answer";
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case -C.Negative => "nagative";
//       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case -C.NegativePi => "nagative-pi";
//       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case -C.MaxJSInt => "max_int";
//       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    default => "default";
  };
}

main() {
  test1(0);
  test2(0);
  test3(0);
}
