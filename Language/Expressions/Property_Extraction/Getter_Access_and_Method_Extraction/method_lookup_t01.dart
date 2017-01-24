/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form e.m proceeds
 * as follows: ...
 * If method lookup succeeds then i evaluates to the closurization of method
 * f on object o
 * @description Check that if lookup succeeds then method f of object o is
 * called
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  static int s() => 0;
  int m() => 1;
}

main() {
  C c = new C();
  var f = c.m;
  Expect.equals(1, f());
}
