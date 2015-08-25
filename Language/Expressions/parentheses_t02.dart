/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression e may always be enclosed in parentheses, but this
 * never has any semantic effect on e.
 * @description Checks that enclosing in parentheses has no semantic effect.
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

class C {
  method() {}
  var id;

  test() {
    //number literals
    Expect.equals(1, (1));
    Expect.equals(0.5, (0.5));

    //string literals
    Expect.equals('', (''));
    Expect.equals("", (""));

    //null
    Expect.equals(null, (null));

    //this
    Expect.equals(this, (this));

    //boolean literals
    Expect.equals(true, (true));

    //conditional expression
    Expect.equals(true ? true : false, (true ? true : false));

    //logical expressions
    (true || true);
    (false && false);

    //bitwise expressions
    Expect.equals(1 ^ 1, (1 ^ 1));

    //identifier reference
    Expect.equals(id, (id));

    //type test
    Expect.equals(1 is int, (1 is int));

    // type cast
    Expect.equals(1 as int, (1 as int));
  }
}

main() {
  new C().test();
}
