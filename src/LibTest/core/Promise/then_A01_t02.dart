/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Promise then(callback(T value))
 * When this promise completes, execute [callback]. The result of [callback]
 * will be exposed through the returned promise. This promise, and the
 * resulting promise (r) are connected as follows:
 *  - this.complete --> r.complete (with the result of [callback])
 *  - this.error    --> r.error (the same error is propagated to r)
 *  - this.cancel   --> r.error (the cancellation is shown as an error to r)
 *  - r.cancel      --> this continues executing regardless.
 * @description Checks that calling this method with non-function object results in ObjectNotClosureException
 * in scripting mode
 * @author msyabro
 * @reviewer kaigorodov
 */

#import("../../../Utils/dynamic_check.dart");

check(Object obj) {
  if(!isCheckedMode()) {
    Promise p = new Promise();
    Promise p1 = p.then(obj);
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
