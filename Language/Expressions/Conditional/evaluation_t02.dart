/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a conditional expression c of the form e1 ? e2 : e3
 * proceeds as follows:
 * First, e1 is evaluated to an object o1. Then, o1 is subjected to boolean
 * conversion producing an object r. If r is true, then the value of c is the
 * result of evaluating the expression e2. Otherwise the value of c is the
 * result of evaluating the expression e3.
 * @description Checks that only one of e2 and e3 is evaluated.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  1 > 2 ? Expect.fail("Wrong expressions were evaluated") : true;
  1 < 2 ? true : Expect.fail("Wrong expressions were evaluated");
}
