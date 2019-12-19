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
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

String _log = "";
int _counter = 0;

String init(String val, void readme()) {
  _counter++;
  _log = "init('$val'), counter: $_counter";
  if (_counter == 1) {
    readme();
    throw new Exception();
  }
  return val;
}

void clear() {
  _log = "";
  _counter = 0;
}

class C {
  static late final String s1 = init("When", (){C.s1;});
  static late String s2 = init("I found", (){C.s2;});
  covariant late String v1 = init("myself", (){this.v1;});
  late final String v2 = init("in time", (){this.v2;});
  late String v3 = init("of trouble", (){this.v3;});
}

late final String g1 = init("Mother Mary", (){g1;});
late String g2 = init("comes to me", (){g2;});

main() {
  Expect.equals("", _log);
  Expect.throws(() {C.s1;});
  Expect.equals("When", C.s1);
  Expect.equals("init('When'), counter: 2", _log);
  clear();

  Expect.throws(() {C.s2;});
  Expect.equals("I found", C.s2);
  Expect.equals("init('I found'), counter: 2", _log);
  clear();

  C c = new C();
  Expect.equals("", _log);

  Expect.throws(() {c.v1;});
  Expect.equals("myself", c.v1);
  Expect.equals("init('myself'), counter: 2", _log);
  clear();

  Expect.throws(() {c.v2;});
  Expect.equals("in time", c.v2);
  Expect.equals("init('in time'), counter: 2", _log);
  clear();

  Expect.throws(() {c.v3;});
  Expect.equals("of trouble", c.v3);
  Expect.equals("init('of trouble'), counter: 2", _log);
  clear();

  Expect.throws(() {g1;});
  Expect.equals("Mother Mary", g1);
  Expect.equals("init('Mother Mary'), counter: 2", _log);
  clear();

  Expect.throws(() {g2;});
  Expect.equals("comes to me", g2);
  Expect.equals("init('comes to me'), counter: 2", _log);
}
