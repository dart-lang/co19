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
    var x;
    x = {};

    x = {"1": 1, "2": true, "3": null, "4": ""};
    x = {"map": {"1": 1, "2": 2}, "list": []};

    x = {"": (){}, "f": f() => 1, "g": void g(p1) {return p1;}};

    x = {"top-level": topFunc(), "method": this.method()};

    x = {"assignment": id = 1, "compound": id *= 1};

    x = {"==": id == 1, "===": 1 === 2, "!=": true != false};

    x = {">": 1 > 2, ">=": 3 >= 3, "<=": 0 <= 4, "<": id < 1};

    x = {"||": true || false, "&&": false && false};

    x = {"|": 20 | 0, "&": 7 & 2, "^": 1 ^ 1};

    x = {"+": 1e7 + 1e-7, "-": 7 - 100e-100};

    x = {"*": 2 * 3, "/": 0 / 1, "%": 5 % 1, "~/": .5 ~/ 2};

    x = {"conditional": 1 + 2 > 3 ? [] : 1 < 3 ? {} : () {}};

    x = {"this": this, "new": new Test()};

    x = {"class": const S(), "map": const {}, "list": const [1]};

    x = {"<<": 1 << 1, ">>": 10 >> 2};

    x = {"-": -1, "!": !true, "~": ~id};

    x = {"++": id++, "--": --id};

    x = {"is bool": true is bool, "is not int": false is! int};
  }

  constants() {
    var x;
    x = const {};

    x = const <int> {"key1": 1, "key2": 2 + 2};
    x = const <String> {"1": "2", "3": "4"};
    x = const <List> {"l1": const [], "l2": const [1, 2, 3]};
    x = const <Map> {"" : const {}};
    x = const {"int": 1, "bool" : true, "S": const S(), "list": const []};
  }

  typeVariables() {
    var x;
    x = <int> {"key": 1};
    x = <String> {"key": "value"};
    x = <bool> {"key": true};
    x = <Test> {"key": new Test()};
    x = <Function> {"key": (){}};
  }

  endsWithComma() {
    var x;
    x = {"1": 2,};
    x = const {"1": true, "2": false,};
    x = <int> {"key": 1,};
  }

  interpolation() {
    var x = 1;
    var y = true;
    var z = new Object();
    var map;

    map = <int>{"variable $x" : 1, "${x + 1}": 2};
    map = <bool>{"variable $y": true, "${y && false}": false};
    map = <Object>{"variable $z": new Object()};
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