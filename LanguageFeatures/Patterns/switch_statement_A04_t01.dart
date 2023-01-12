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

class MyNumber {
  const MyNumber();
}

class Number1 extends MyNumber {
  final String name;
  final int value;
  const Number1({required String name, required int value})
      : this.name = name,
        this.value = value + 1;
}

class Number2 extends MyNumber {
  final String name;
  final int value;
  const Number2()
      : this.name = "zero",
        this.value = 0;
}

String test(MyNumber value) {
  switch (value) {
    case Number1(name: "one", value: 2):
      return "match-1";
    case Number2():
      return "match-2";
    default:
      return "no match";
  }
}

main() {
  var one = new Number1(name: "one", value: 1);
  var zero = new Number2();
  Expect.equals("match-1", test(one));
  Expect.equals("match-2", test(zero));

  const constOne = Number1(name: "one", value: 1);
  const constZero = Number2();
  Expect.equals("match-1", test(constOne));
  Expect.equals("match-2", test(constZero));
}
