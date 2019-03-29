/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A map literal denotes a map object.
 * mapLiteral:
 *   const? typeArguments? '{' (mapLiteralEntry (',' mapLiteralEntry)* ','?)?
 *   '}'
 * ;
 * mapLiteralEntry:
 *   expression ':' expression
 * ;
 * A map literal consists of zero or more entries. Each entry has a key and a
 * value. Each key and each value is denoted by an expression.
 * @description Checks that various map keys don't produce a compile-time
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
    Map x;
    x = {};

    x = {"1": 1, "2": true, "3": null, "4": ""};
    x = {"map": {"1": 1, "2": 2}, "list": []};

    x = {"": () {}, "f": () => 1, "g": (p1) {return p1;}};

    x = {"top-level": topFunc(), "method": this.method()};

    x = {"assignment": id = 1, "compound": id *= 1};

    x = {"==": id == 1, "===": identical(1, 2), "!=": true != false};

    x = {">": 1 > 2, ">=": 3 >= 3, "<=": 0 <= 4, "<": id < 1};

    x = {"||": true || false, "&&": false && false};

    x = {"|": 20 | 0, "&": 7 & 2, "^": 1 ^ 1};

    x = {"+": 1e7 + 1e-7, "-": 7 - 100e-100};

    x = {"*": 2 * 3, "/": 0 / 1, "%": 5 % 1, "~/": .5 ~/ 2};

    x = {"conditional": 1 + 2 > 3 ? [] : 1 < 3 ? {} : () {}};

    x = {"this": this, "new": new Test()};

    x = {"class": const S(), "map": const {}, "list": const [1]};

    x = {"<<": 1 << 1, ">>": 10 >> 2};

    x = {">>>": 1 >>> 1, 1222 >>> 10: 14};

    x = {"-": -1, "!": !true, "~": ~id};

    x = {"++": id++, "--": --id};

    x = {"is bool": true is bool, "is not int": false is! int};

    x = {5: true, 6: false};

    x = {1+5: true, 1+6: false};
  }

  constants() {
    var x;
    x = const {};

    x = const <String, int>{"key1": 1, "key2": 2 + 2};
    x = const <String, String>{"1": "2", "3": "4"};
    x = const <String, List>{"l1": const [], "l2": const [1, 2, 3]};
    x = const <String, Map>{"" : const {}};
    x = const {"int": 1, "bool" : true, "S": const S(), "list": const []};
  }

  typeVariables() {
    var x;
    x = <String, int>{"key": 1};
    x = <String, String>{"key": "value"};
    x = <String, bool>{"key": true};
    x = <String, Test>{"key": new Test()};
    x = <String, Function>{"key": () {}};
  }

  endsWithComma() {
    var x;
    x = {"1": 2,};
    x = const {"1": true, "2": false,};
    x = <String, int>{"key": 1,};
  }

  interpolation() {
    var x = 1;
    var y = true;
    var z = new Object();
    var map;

    map = <String, int>{"variable $x" : 1, "${x + 1}": 2};
    map = <String, bool>{"variable $y": true, "${y && false}": false};
    map = <String, Object>{"variable $z": new Object()};
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
