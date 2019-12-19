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
 * process of evaluating its own initializer expression but write to the
 * variable occurred, then initializer expression is not evaluated again
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
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
  _log = "";
  _counter = 0;
}

class C {
  static late String s =
      init("No woman", "no cry", (){C.s = "Lily was here"; C.s;});
}

late String g =
      init("No woman", "no cry", (){g = "Lily was here"; g;});

main() {
  Expect.equals("", _log);
  Expect.equals("no cry", C.s);
  Expect.equals("counter: 1", _log);
  clear();

  Expect.equals("no cry", g);
  Expect.equals("counter: 1", _log);
}
