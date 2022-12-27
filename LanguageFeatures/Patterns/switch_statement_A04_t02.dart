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
/// Constant constructors. A switch case can be a constant constructor call with
/// implicit const, like:
/// ```
/// case SomeClass(1, 2):
/// ```
/// With this proposal, that is interpreted as an object pattern whose arguments
/// are subpatterns.
///
/// @description Checks that constant constructor is not called in case of an
/// object pattern in a switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class Number {
  final String name;
  final int value;
  const Number(String name, int value)
      : this.name = name,
        this.value = value;
}

String test(Number value) {
  switch (value) {
    case Number("one", 1):
      return "match";
    default:
      return "no match";
  }
}

main() {
  var one = new Number("one", 1);
  var zero = new Number("zero", 0);
  Expect.equals("match", test(one));
  Expect.equals("match", test(zero));

  const constOne = Number("one", 1);
  const constZero = Number("zero", 0);
  Expect.equals("match", test(constOne));
  Expect.equals("match", test(constZero));
}
