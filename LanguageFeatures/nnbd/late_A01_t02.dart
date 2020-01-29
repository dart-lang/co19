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
 *
 * @description Check that a read of a field or variable which is marked as late
 * which has not yet been written to causes the initializer expression of the
 * variable to be evaluated to a value, assigned to the variable or field, and
 * returned as the value of the read
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

String _log = "";

String init(String val) {
  _log += "init('$val')";
  return val;
}

void clearLog() {
  _log = "";
}

class C {
  static late final String? s1 = init("When");
  static late String? s2 = init("I found");
  covariant late String? v1 = init("myself");
  late final String? v2 = init("in time");
  late String? v3 = init("of trouble");
}

late final String? g1 = init("Mother Mary");
late String? g2 = init("comes to me");

main() {
  late final String? l1 = init("Speaking words of wisdom");
  late String? l2 = init("let it be");

  Expect.equals("", _log);
  clearLog();

  Expect.equals("When", C.s1);
  Expect.equals("init('When')", _log);
  clearLog();

  Expect.equals("I found", C.s2);
  Expect.equals("init('I found')", _log);
  clearLog();

  C c = new C();
  Expect.equals("", _log);
  Expect.equals("myself", c.v1);
  Expect.equals("init('myself')", _log);
  clearLog();

  Expect.equals("in time", c.v2);
  Expect.equals("init('in time')", _log);
  clearLog();

  Expect.equals("of trouble", c.v3);
  Expect.equals("init('of trouble')", _log);
  clearLog();

  Expect.equals("Mother Mary", g1);
  Expect.equals("init('Mother Mary')", _log);
  clearLog();

  Expect.equals("comes to me", g2);
  Expect.equals("init('comes to me')", _log);
  clearLog();

  Expect.equals("Speaking words of wisdom", l1);
  Expect.equals("init('Speaking words of wisdom')", _log);
  clearLog();

  Expect.equals("let it be", l2);
  Expect.equals("init('let it be')", _log);
}
