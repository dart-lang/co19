/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let d be the declaration of a static variable v. The implicit getter method of v executes as follows:
 *   If d is of one of the forms static var v = e; , static T v = e; , static final v = e;
 * or static final T v = e; and no value has yet been stored into v then the initializer
 * expression e is evaluated. If the evaluation succeeded yielding an object o, let r = o,
 * otherwise let r = null. In any case, r is stored into v. The result of executing the getter is r. Otherwise
 *   The result of executing the getter method is the value stored in v.
 * @description Checks the result of the getter and that the initializer expression is evaluated only once.
 * @author msyabro
 * @reviewer iefremov
 */

String log = "";
writeLog(int i) {
  log = "${log}${i}";
  return i;
}

class C {
  static var a = writeLog(1);
  static int b = writeLog(2);
  static final c = writeLog(3);
  static final int d = writeLog(4);
}

main() {
  Expect.equals(4, C.d);
  Expect.equals(1, C.a);
  Expect.equals(2, C.b);
  Expect.equals(3, C.c);

  Expect.equals("4123", log, "Lazy static getters execution was wrong!");
}
