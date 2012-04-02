/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A map literal denotes a map from strings to objects.
 * mapLiteral:
 *   const? typeArguments? '{' (mapLiteralEntry (',' mapLiteralEntry)* ','?)? '}'
 * ;
 * mapLiteralEntry:
 *   stringLiteral ':' expression
 * ;
 * A map literal consists of zero or more entries. Each entry has a key, which is a
 * string literal, and a value, which is an object.
 * @description Checks that various map literals don't produce a compile-time errors.
 * @author msyabro
 * @reviewer kaigorodov
 */

topFunc() {}

class S {
  const S();
}

class Test  {
  method() {}
  var id;

  expressions() {
    {};

    {"1": 1, "2": true, "3": null, "4": ""};
    {"map": {"1": 1, "2": 2}, "list": []};

    {"": (){}, "f": f() => 1, "g": void g(p1) {return p1;}};

    {"top-level": topFunc(), "method": this.method()};

    {"assignment": id = 1, "compound": id *= 1};

    {"==": id == 1, "===": 1 === 2, "!=": true != false};

    {">": 1 > 2, ">=": 3 >= 3, "<=": 0 <= 4, "<": id < 1};

    {"||": true || false, "&&": false && false};

    {"|": 20 | 0, "&": 7 & 2, "^": 1 ^ 1};

    {"+": 1e7 + 1e-7, "-": 7 - 100e-100};

    {"*": 2 * 3, "/": 0 / 1, "%": 5 % 1, "~/": .5 ~/ 2};

    {"conditional": 1 + 2 > 3 ? [] : 1 < 3 ? {} : () {}};

    {"this": this, "new": new Test()};

    {"class": const S(), "map": const {}, "list": const [1]};

    {"<<": 1 << 1, ">>": 10 >> 2};

    {"-": -1, "!": !true, "~": ~id};

    {"++": id++, "--": --id};

    {"is bool": true is bool, "is not int": false is! int};
  }

  constants() {
    const {};

    const <int> {"key1": 1, "key2": 2 + 2};
    const <String> {"1": "2", "3": "4"};
    const <List> {"l1": const [], "l2": const [1, 2, 3]};
    const <Map> {"" : const {}};
    const {"int": 1, "bool" : true, "S": const S(), "list": const []};
  }

  typeVariables() {
    <int> {"key": 1};
    <String> {"key": "value"};
    <bool> {"key": true};
    <Test> {"key": new Test()};
    <Function> {"key": (){}};
  }

  endsWithComma() {
    {"1": 2,};
    const {"1": true, "2": false,};
    <int> {"key": 1,};
  }

  interpolation() {
    var x = 1;
    var y = true;
    var z = new Object();

    <int>{"variable $x" : 1, "${x + 1}": 2};
    <bool>{"variable $y": true, "${y && false}": false};
    <Object>{"variable $z": new Object()};
  }

}

main() {
  Test t = new Test();
  t.expressions();
  t.constants();
  t.typeVariables();
  t.endsWithComma();
  t.interpolation();
}