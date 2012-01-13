/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void join(Collection<Promise<T>> arr, bool joinDone(Promise<T> completed))
 * Mark this promise as complete when some or all values in [arr] are
 * computed. Every time one of the promises is computed, it is passed to
 * [joinDone]. When [joinDone] returns true, this instance is marked as
 * complete with the last value that was computed.
 * @description Checks that calling this method with non-function object results in ObjectNotClosureException
 * in scripting mode
 * @author msyabro
 * @reviewer kaigorodov
 */

#import("../../../../Utils/dynamic_check.dart");

check(Object obj) {
  if(!isCheckedMode()) {
    Promise p = new Promise();
    Promise p1 = new Promise();
    p.join([p1], obj);
    try {
      p1.complete(1);
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
