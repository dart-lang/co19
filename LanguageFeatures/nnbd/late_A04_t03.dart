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
 * Evaluating the initializer expression may cause an exception to be thrown. If
 * the variable was written to before the exception was thrown, the value of the
 * variable on subsequent reads is the last written value. If the variable was
 * not written before the exception was thrown, then the next read attempts to
 * evaluate the initializer expression again.
 *
 * @description Check that if evaluating of the initializer expression throws an
 * exception and the value of the variable was not written to then next read
 * attempts to evaluate the initializer expression again
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

String _log = "";
bool _called = false;

String init(String val) {
  _log += "init('$val')";
  if (!_called) {
    _called = true;
    throw new Exception();
  }
  return val;
}

void clearLog() {
  _log = "";
  _called = false;
}

class C {
  static late String s = init("Lily");
  covariant late String v1 = init("was");
  late String v2 = init("here");
}

late String g = init("Let it be");

main() {
  Expect.equals("", _log);
  Expect.throws(() {C.s;});
  Expect.equals("Lily", C.s);
  Expect.equals("init('Lily')init('Lily')", _log);
  clearLog();

  C c = new C();
  Expect.equals("", _log);
  Expect.throws(() {c.v1;});
  Expect.equals("was", c.v1);
  Expect.equals("init('was')init('was')", _log);
  clearLog();

  Expect.throws(() {g;});
  Expect.equals("Let it be", g);
  Expect.equals("init('Let it be')init('Let it be')", _log);
  clearLog();
}
