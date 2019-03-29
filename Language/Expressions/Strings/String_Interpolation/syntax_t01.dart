/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is possible to embed expressions within non-raw string
 * literals, such that these expressions are evaluated, and the resulting
 * values are converted into strings and concatenated with the enclosing
 * string. This process is known as string interpolation.
 * stringInterpolation:
 *   '$' IDENTIFIER_NO_DOLLAR |
 *   '$' '{' expression '}'
 * ;
 * @description Checks that interpolated strings that are valid according to
 * the specification don't produce compile-time errors.
 * @author msyabro
 */
// SharedOptions=--enable-experiment=triple-shift

import 'String_Interpolation_lib.dart';

topFunc(p1, p2) {}
var topVar;

class S {
  const S();
}

class Test {
  method() {}
  var id = null;

  expressions() {
    //literals
    "${1}";
    "${0.5}";
    "${false}";
    '${r'string'}';
    "${"${"${1}"}"}";
    '${null}';
    "${this}";
    '''${[1, 2, 3]}''';
    "${{"key1": 1, "key2": 2}}";
    '${() => 1}';
    "${(p1, [p2]) {return p1 + p2;}}";

    //invocations
    """${topFunc(1, 2)}""";
    '${method()}';
    "${id}";
    '${this.id}';

    //assignment
    "${id = 1}";
    '${id *= 2}';

    //equality
    "${id == 1}";
    '${identical(1, 2)}';
    "${true != false}";
    """${!identical([], [])}""";

    //relational expressions
    '${5 < 10}';
    "${20 >= 0}";
    '${0 <= -1}';
    "${-9 > -0.0}";

    //logical expressions
    '${true || false}';
    "${false && false}";

    //bitwise expressions
    '''${1 & 0}''';
    '${2 | 20}';
    "${10 ^ 10}";

    //additional expressions
    "${0.5 + 9}";
    '${0 - 10}';

    //multiplicative expressions
    "${id * 100}";
    '${2 / 3}';
    '''${5 % 1}''';
    """${2 ~/ 2}""";

    //conditional
    '${1 + 2 > 3 ? [] : 1 < 3 ? {} : () {}}';

    //instance creation
    "${new Test()}";
    '${const S()}';

    //constants
    '${const {}}';
    "${const [1, 2, 3]}";

    //shift expressions
    '${1 >> 2}';
    "${7 << 3}";

    //triple shift expressions
    '${10 >>> 1}';

    //unary expressions
    "${-id}";
    '${!true}';
    """${~1}""";
    '''${id++}''';
    "${--id}";

    //type test
    '${1 is int}';
    "${true is! int}";
  }

  identifiers() {
    var x;
    "$x";

    int i64;
    "$i64";

    String _x_;
    "$_x_";

    "$id";
    "$this";
    "$topVar";

    // from a library imported with no prefix
    "$libVar";
  }
}

main() {
  var o = new Test();
  o.expressions();
  o.identifiers();
}
