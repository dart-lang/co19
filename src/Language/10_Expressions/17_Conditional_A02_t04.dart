/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a conditional expression c of the form e1 ? e2 : e3
 * proceeds as follows:
 * First, e1 is evaluated to an object o1. In checked mode, it is a dynamic
 * type error if o1 is not of type bool. Otherwise, o1 is then subjected to boolean
 * conversion producing an object r. If r is true, then the value of c is the
 * result of evaluating the expression e2. Otherwise the value of c is the result of
 * evaluating the expression e3.
 * @description Checks that o1 is subjected to boolean conversion.
 * @author kaigorodov
 * @reviewer iefremov
 */

#import("../../Utils/dynamic_check.dart");

bool checkTrue(var e1) {
  return e1 ? true : false;
}

bool checkFalse(var e1) {
  return e1 ? false : true;
}

main() {
  Expect.isTrue(checkTrue(true));
  Expect.isTrue(checkFalse(false));

  if(!isCheckedMode()) {
    Expect.isTrue(checkFalse(""));
    Expect.isTrue(checkFalse(" "));
    Expect.isTrue(checkFalse(1));
  }
}
