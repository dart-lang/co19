/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A toplevel or static variable with an initializer is evaluated as
 * if it was marked late. Note that this is a change from pre-NNBD semantics in
 * that:
 *  - Throwing an exception during initializer evaluation no longer sets the
 *    variable to null
 *  - Reading the variable during initializer evaluation is no longer checked
 *    for, and does not cause an error.
 *
 * @description Check that a toplevel or static variable with an initializer is
 * evaluated as if it was marked late.
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

void clear() {
  _log = "";
}

class C {
  static final String s1 = init("No");
  static String s2 = init("woman");
}

final String g1 = init("no");
String g2 = init("cry");

main() {
  Expect.equals("", _log);
  Expect.equals("No", C.s1);
  Expect.equals("init('No')", _log);
  clear();

  Expect.equals("woman", C.s2);
  Expect.equals("init('woman')", _log);
  clear();

  Expect.equals("no", g1);
  Expect.equals("init('no')", _log);
  clear();

  Expect.equals("cry", g2);
  Expect.equals("init('cry')", _log);
}
