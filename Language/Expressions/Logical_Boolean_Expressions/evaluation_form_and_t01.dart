/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a logical boolean expression b of the form e1 && e2
 * causes the evaluation of e1 which is then subjected to boolean conversion,
 * yielding an object o1; if o1 is not true, the result of evaluating b is
 * false, otherwise e2 is evaluated to an object o2, which is then subjected to
 * boolean conversion producing an object r, which is the value of b.
 * @description Checks that an expression of the form e1 && e2 is evaluated
 * correctly
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.isTrue(true && true);
  Expect.isFalse(true && false);
  Expect.isFalse(false && true);
  Expect.isFalse(false && false);
}
