/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasError()
 * Whether the work represented by this promise has finished in an error.
 * @description Checks [: hasError() :] value of a promise in different states.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


check(val, err) {
  Promise p = new Promise();
  Expect.isFalse(p.hasError());

  p.complete(val);
  Expect.isFalse(p.hasError());

  p = new Promise.fromValue(val);
  Expect.isFalse(p.hasError());
  
  p = new Promise();
  p.cancel();
  Expect.isFalse(p.hasError());
  
  p = new Promise();
  p.fail(err);
  Expect.isTrue(p.hasError());
}

main() {
  check(1, -1);
  check(null, null);
}
