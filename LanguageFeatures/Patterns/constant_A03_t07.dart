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
/// List literals are ambiguous with list patterns, so we only allow list
/// literals explicitly marked const. Likewise with set and map literals versus
/// map patterns.
///
/// @description Check empty map and set literals in constant patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String testObject1(Object value) {
  switch (value) {
    case const {}:
      return "{}";
    default:
      return "default";
  }
}

String testObject2(Object value) {
  if (value case const {}) {
    return "{}";
  } else {
    return "default";
  }
}

String testObject3(Object value) {
  return switch (value) {
    const {} => return "{}",
    _ => "default"
  };
}

String testMap1(Map value) {
  switch (value) {
    case const {}:
      return "{}";
    default:
      return "default";
  }
}

String testMap2(Map value) {
  if (value case const {}) {
    return "{}";
  } else {
    return "default";
  }
}

String testMap3(Map value) {
  return switch (value) {
    const {} => "{}",
    _ => "default";
  };
}

String testSet1(Set value) {
  switch (value) {
    case const (<dynamic>{}):
      return "{}";
    default:
      return "default";
  }
}

String testSet2(Set value) {
  if (value case const (<dynamic>{})) {
    return "{}";
  } else {
    return "default";
  }
}

String testSet3(Set value) {
  return switch (value) {
    const (<dynamic>{}) => "{}",
    _ => "default";
  }
}

main() {
  const Map m = {};
  Expect.equals("{}", testObject1(m));
  Expect.equals("{}", testObject2(m));
  Expect.equals("{}", testObject3(m));
  Expect.equals("{}", testMap1(m));
  Expect.equals("{}", testMap2(m));
  Expect.equals("{}", testMap3(m));

  const Set s = {};
  Expect.equals("default", testObject1(s));
  Expect.equals("default", testObject2(s));
  Expect.equals("default", testObject3(s));
  Expect.equals("{}", testSet1(s));
  Expect.equals("{}", testSet2(s));
  Expect.equals("{}", testSet3(s));
}
