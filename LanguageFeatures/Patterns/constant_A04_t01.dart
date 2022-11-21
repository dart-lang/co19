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
/// Constructor calls are ambiguous with object patterns, so we require const
/// constructor calls to be explicitly marked const.
///
/// @description Check const constructors calls in constant patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  final v;
  const C(this.v);
}

String test1(C value) {
  switch (value) {
    case const C(0):
      return "0";
    case const C(1):
      return "1";
    case const C("x"):
      return "x";
    default:
      return "default";
  }
}

String test2(C value) {
  if (value case const C(0)) {
    return "0";
  } else if (value case const C(1)) {
    return "1";
  } else if (value case const C("x")) {
    return "x";
  } else {
    return "default";
  }
}

main() {
  Expect.equals("0", test1(const C(0)));
  Expect.equals("default", test1(C(0)));
  Expect.equals("1", test1(const C(1)));
  Expect.equals("default", test1(C(1)));
  Expect.equals("x", test1(const C("x")));
  Expect.equals("default", test1(C("x")));
  Expect.equals("default", test1(const C(2)));
  Expect.equals("default", test1(const C("y")));

  Expect.equals("0", test2(const C(0)));
  Expect.equals("default", test2(C(0)));
  Expect.equals("1", test2(const C(1)));
  Expect.equals("default", test2(C(1)));
  Expect.equals("x", test2(const C("x")));
  Expect.equals("default", test2(C("x")));
  Expect.equals("default", test2(const C(2)));
  Expect.equals("default", test2(const C("y")));
}
