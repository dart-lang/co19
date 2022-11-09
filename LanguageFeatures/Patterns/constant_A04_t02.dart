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
/// @description Check const generic constructors calls in a constant patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C<T> {
  final v;
  const C(this.v);
}

String test(C value) {
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

main() {
  Expect.equals("0", test(const C<String>(0)));
  Expect.equals("default", test(C<String>(0)));
  Expect.equals("default", test(const C<int>(0)));
  Expect.equals("1", test(const C<num>(1)));
  Expect.equals("default", test(C<num>(1)));
  Expect.equals("default", test(const C<String>(1)));
  Expect.equals("x", test(const C<bool>("x")));
  Expect.equals("default", test(C("x")));
  Expect.equals("default", test(const C("x")));
  Expect.equals("default", test(const C("y")));
}
