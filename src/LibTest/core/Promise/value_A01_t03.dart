/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T get value()
 * The value once it is computed. It will be null when the promise is in
 * progress ([: !isDone() :]), when it was cancelled ([: isCancelled() :]), or
 * when the computed value is actually null.
 * @description Checks [: value :] value after [: fail() :] call.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Case is not descrided. Assumed exception. Issue 232.
 */


main() {
  Promise p = new Promise();
  p.fail("test fail");

  bool fail = false;
  try {
    p.value;
    fail = true;
  } catch(var i) {}
  if(fail) {
    Expect.fail("Some exception is expected");
  }
}

  
