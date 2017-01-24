/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form e.m proceeds
 * as follows:
 * First, the expression e is evaluated to an object o. Let f be the result of
 * looking up method m in o with respect to the current library L. If o is an
 * instance of Type but e is not a constant type literal, then if f is a method
 * that forwards to a static method, method lookup fails
 * @description Check that if object is a constant type literal and result of
 * method lookup forwards to a static method, then lookup does not fail
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  static int s() => 0;
  int m() => 1;
}

main() {
  var f = C.s;
  Expect.isNotNull(f);
  Expect.equals(0, f());
}
