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
/// Constructor calls are ambiguous with object patterns, so we require const
/// constructor calls to be explicitly marked const.
///
/// @description Check const generic constructors calls in constant patterns
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C<T> {
  final v;
  const C(this.v);
}

String test1(C value) {
  switch (value) {
    case const C<String>(0):
      return "0";
    case const C<num>(1):
      return "1";
    case const C<bool>("x"):
      return "x";
    default:
      return "default";
  }
}

String test2(C value) {
  if (value case const C<String>(0)) {
    return "0";
  } else if (value case const C<num>(1)) {
    return "1";
  } else if (value case const C<bool>("x")) {
    return "x";
  } else {
    return "default";
  }
}

String test3(C value) {
  return switch (value) {
    const C<String>(0) => "0",
    const C<num>(1) => "1",
    const C<bool>("x") => "x",
    _ => "default"
  };
}

main() {
  Expect.equals("0", test1(const C<String>(0)));
  Expect.equals("default", test1(C<String>(0)));
  Expect.equals("default", test1(const C<int>(0)));
  Expect.equals("1", test1(const C<num>(1)));
  Expect.equals("default", test1(C<num>(1)));
  Expect.equals("default", test1(const C<String>(1)));
  Expect.equals("x", test1(const C<bool>("x")));
  Expect.equals("default", test1(C("x")));
  Expect.equals("default", test1(const C("x")));
  Expect.equals("default", test1(const C("y")));

  Expect.equals("0", test2(const C<String>(0)));
  Expect.equals("default", test2(C<String>(0)));
  Expect.equals("default", test2(const C<int>(0)));
  Expect.equals("1", test2(const C<num>(1)));
  Expect.equals("default", test2(C<num>(1)));
  Expect.equals("default", test2(const C<String>(1)));
  Expect.equals("x", test2(const C<bool>("x")));
  Expect.equals("default", test2(C("x")));
  Expect.equals("default", test2(const C("x")));
  Expect.equals("default", test2(const C("y")));

  Expect.equals("0", test3(const C<String>(0)));
  Expect.equals("default", test3(C<String>(0)));
  Expect.equals("default", test3(const C<int>(0)));
  Expect.equals("1", test3(const C<num>(1)));
  Expect.equals("default", test3(C<num>(1)));
  Expect.equals("default", test3(const C<String>(1)));
  Expect.equals("x", test3(const C<bool>("x")));
  Expect.equals("default", test3(C("x")));
  Expect.equals("default", test3(const C("x")));
  Expect.equals("default", test3(const C("y")));
}
