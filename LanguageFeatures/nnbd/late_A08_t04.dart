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
 * @description Check that throwing an exception during initializer evaluation
 * no longer sets a toplevel or static variable no null
 * @author sgrekhov@unipro.ru
 * @issue 40390
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
  _counter = 0;
}

class C {
  static final String? s1 = init("No", (){C.s1;});
  static String? s2 = init("woman", (){C.s2;});
}

final String? g1 = init("no", (){g1;});
String? g2 = init("cry", (){g2;});

main() {
  Expect.equals("", _log);
  Expect.throws(() {C.s1;});
  Expect.equals("No", C.s1);
  Expect.equals("init('No'), counter: 2", _log);
  clear();

  Expect.throws(() {C.s2;});
  Expect.equals("woman", C.s2);
  Expect.equals("init('woman'), counter: 2", _log);
  clear();

  Expect.throws(() {g1;});
  Expect.equals("no", g1);
  Expect.equals("init('no'), counter: 2", _log);
  clear();

  Expect.throws(() {g2;});
  Expect.equals("cry", g2);
  Expect.equals("init('cry'), counter: 2", _log);
}
