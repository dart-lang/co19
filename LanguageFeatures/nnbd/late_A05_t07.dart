/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A read of a field or variable which is marked as late which has
 * not yet been written to causes the initializer expression of the variable to
 * be evaluated to a value, assigned to the variable or field, and returned as
 * the value of the read.
 * ...
 * If a variable or field is read from during the process of evaluating its own
 * initializer expression, and no write to the variable has occurred, the read
 * is treated as a first read and the initializer expression is evaluated again.
 *
 * @description Check that if a variable or field is read from during the
 * process of evaluating its own initializer expression, and no write to the
 * variable has occurred, the read is treated as a first read and the
 * initializer expression is evaluated again
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

String _log = "";
int _counter = 0;

String init(String val1, String val2, void writeAndReadme()) {
  _counter++;
  _log = "counter: $_counter";
  if (_counter == 1) {
    writeAndReadme();
    return val2;
  }
  return val1;
}

void clear() {
  _counter = 0;
}

class C {
  covariant late String v1;
  late final String v2;
  late String v3;

  C() : v1 = init("No woman", "no cry", (){this.v1 = "Lily was here"; this.v1;}),
        v2 = init("No woman", "no cry", (){this.v2 = "Lily was here"; this.v2;}),
        v3 = init("No woman", "no cry", (){this.v3 = "Lily was here"; this.v3;});
}

main() {
  C c = new C();
  Expect.equals("", _log);

  Expect.equals("no cry", c.v1);
  Expect.equals("counter: 1", _log);
  clear();

  Expect.equals("no cry", c.v2);
  Expect.equals("counter: 1", _log);
  clear();

  Expect.equals("no cry", c.v3);
  Expect.equals("counter: 1", _log);
}
