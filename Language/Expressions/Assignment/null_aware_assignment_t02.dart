/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment a of the form e1?.v = e2 is equivalent
 * to the evaluation of the expression ((x) => x == null?null : x.v = e2)(e1)
 * unless e1 is a type literal, in which case it is equivalent to e1.v = e2.
 * @description Checks that an assignment a of the form e1?.v = e2 is equivalent
 * to the evaluation of the expression ((x) => x == null?null : x.v = e2)(e1).
 * Test the case when e1 != null
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  var v;
}

int count = 0;

int e() {
  count++;
  return 0;
}

main() {
  C c = new C();
  var x = c?.v = e() + 1;
  Expect.equals(1, c.v);
  Expect.equals(1, x);
  Expect.equals(1, count);
}
