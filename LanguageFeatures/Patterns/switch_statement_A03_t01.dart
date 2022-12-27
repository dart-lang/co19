// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend switch statements to allow patterns in cases:
///
/// switchStatement         ::= 'switch' '(' expression ')'
///                         '{' switchStatementCase* switchStatementDefault? '}'
/// switchStatementCase     ::= label* 'case' guardedPattern ':' statements
/// guardedPattern          ::= pattern ( 'when' expression )?
/// switchStatementDefault  ::= label* 'default' ':' statements
/// ...
/// Many constant expressions are subsumed by the new pattern syntax so most
/// existing switch cases have the same semantics under this proposal. However,
/// patterns are not a strict superset of constant expressions and some switches
/// may be broken.
/// ...
/// Wildcards. A switch case containing the identifier _ currently matches if
/// the matched value is equal to the constant named _. With this proposal, it
/// becomes a wildcard that always matches.
///
/// @description Checks that _ in a switch statement is a wildcard that always
/// matches
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

const _ = 42;

String test(int value) {
  switch (value) {
    case _:
      return "match";
    default:
      return "no match";
  }
}

main() {
  Expect.equals("match", test(42));
  Expect.equals("match", test(_));
  Expect.equals("match", test(0));
  Expect.equals("match", test(1));
  Expect.equals("match", test(-42));
}
