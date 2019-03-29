/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A list literal denotes a list, which is an integer indexed
 * collection of objects.
 * listLiteral:
 *   const? typeArguments? '[' (expressionList ','?)? ']'
 * ;
 * @description Checks that various list literals don't produce a compile-time
 * errors.
 * @author msyabro
 */
// SharedOptions=--enable-experiment=triple-shift

topFunc() {}

class S {
  const S();
}

class Test  {
  method() {}
  var id;

  expressions() {
    [];

    [1, true, null, ""];
    [{"1": 1, "2": 2}, []];

    [() {}, () => 1, (p1) {return p1;}];

    [topFunc(), this.method()];

    [id = 1,id *= 1];

    [id == 1, identical(1, 2), true != false];

    [1 > 2, 3 >= 3, 0 <= 4, id < 1];

    [true || false, false && false];

    [20 | 0, 7 & 2, 1 ^ 1];

    ["a" "b", 7 - 100e-100];

    [2 * 3, 0 / 1, 5 % 1, .5 ~/ 2];

    [1 + 2 > 3 ? [] : 1 < 3 ? {} : () {}];

    [this, new Test()];

    [const S(), const {}, const [1]];

    [1 << 1, 10 >> 2];

    [1 >>> 1, 10 >>> 2, 367 >>> 14];

    [ -1, !true, ~id];

    [id++, --id];

    [true is bool, false is! int];
  }

  constants() {
    const [];

    const <int> [1, 2 + 2];
    const <String> ["1", "2", "3", "4"];
    const <List> [const [], const [1, 2, 3]];
    const <Map> [const {}];
    const [ 1, true, const S(), const []];
  }

  typeVariables() {
    <int> [1, 2];
    <String> ["index 0", "index 1"];
    <bool> [true, false && true];
    <Test> [new Test()];
    <Function> [() {}, () => 1];
  }

  endsWithComma() {
    ["1", 2,];
    const [true, false, ];
    <int> [1, 2,];
  }
}

main() {
  Test t = new Test();
  t.expressions();
  t.constants();
  t.typeVariables();
  t.endsWithComma();
}
