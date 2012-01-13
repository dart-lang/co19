/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addCompleteHandler(void completeHandler(T result))
 * Register a normal continuation to execute when the value is available.
 * @description Checks that calling this method with non-function object results in ObjectNotClosureException
 * in scripting mode
 * @author msyabro
 * @reviewer kaigorodov
 */

#import("../../../Utils/dynamic_check.dart");

check(Object obj) {
  if(!isCheckedMode()) {
    Promise p = new Promise();
    p.addCompleteHandler(obj);
    try {
      p.complete(1);
      Expect.fail("ObjectNotClosureException is expected");
    } catch(ObjectNotClosureException e) {}
  }
}

main() {
  int x;

  check(1);
  check(x);
  check(new Object());
  check("String");
  check(true);
  check(null);
  check([]);
}
