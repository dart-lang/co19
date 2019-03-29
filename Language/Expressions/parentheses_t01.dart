/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression e may always be enclosed in parentheses, but this
 * never has any semantic effect on e.
 * @description Checks that any expression can be enclosed in parentheses.
 * @author msyabro
 */
// SharedOptions=--enable-experiment=triple-shift

class C {
  method() {}
  var id;
  test() {
    //number literals
    (1);
    (0.5);

    //string literals
    ('');
    ("");

    //null
    (null);

    //this
    (this);

    //boolean literals
    (true);

    //list literal
    ([1, 2, 3]);

    //map literal
    ({'1': 1, '2': 2});

    //function expressions
    (()=> 1);
    (() {});

    //instance creation
    (new C());

    //invocation
    var o = new C();
    (o.method());
    (method());
    (o.id);

    //assignment
    (id = 1);
    (id += 1);
    (id -= 1);

    //conditional expression
    (true ? true : false);

    //logical expressions
    (true || true);
    (false && false);

    //bitwise expressions
    (1 ^ 1);
    (0 & 1);
    (0 | 0);

    //relational expressions
    (1 < 2);
    (3 > 2);

    //equality
    (identical(this, this));
    ('' == "");
    (1 != 1);

    //shift expressions
    (1 << 1);
    (2 >> 1);

    //triple shift expressions
    (25 >>> 1);

    //additive expressions
    (1 + 2);
    (0 - 0);

    //multiplicative expressions
    (2 * 1);
    (1 / 1);
    (0 ~/ 1);
    (9 % 3);

    //unary expressions
    (id++);
    (--id);
    (-1);
    (~1);
    (!false);

    //identifier reference
    (id);

    //type test
    (1 is int);
    (2 is! int);

    // type cast
    (1 as int);
  }
}

main() {
  new C().test();
}
