/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a postfix expression of the form v++, where v is an
 * identifier, is equivalent to executing (){var r = v; v = r + 1; return r}().
 * ...
 * The above ensures that if v is a field, the getter gets called exactly once.
 * Likewise in the cases below.
 * @description Checks that in C.v++ expression, the getter gets called exactly
 * once
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  static int getCounter = 0;
  static int _v = 0;

  static int get v {
    getCounter++;
    return _v;
  }
  static void set v(int val) {
     _v = val;
  }
}

main() {
  C.v++;
  Expect.equals(C.getCounter, 1);
}
