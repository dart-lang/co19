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
/// List literals are ambiguous with list patterns, so we only allow list
/// literals explicitly marked const. Likewise with set and map literals versus
/// map patterns.
///
/// @description Check empty map and set literals in constant patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(Object value) {
  switch (value) {
    case const {}:
      return "{}";
    default:
      return "default";
  }
}

String test2(Object value) {
  if (value case const {}) {
    return "{}";
  } else {
    return "default";
  }
}

main() {
  const Map m = {};
  Expect.equals("{}", test1(m));
  Expect.equals("{}", test2(m));

  const Set s = {};
  Expect.equals("default", test1(s));
  Expect.equals("default", test2(s));
}
