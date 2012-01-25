/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isCancelled()
 * Whether the work represented by this promise has been cancelled.
 * @description Checks [: isCancelled() :] value of a promise in different states.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  // construction
  Promise p = new Promise();
  Expect.isFalse(p.isCancelled());

  // fail()
  p.fail(-10);
  Expect.isFalse(p.isCancelled());

  // complete()
  p = new Promise();
  p.complete(13);
  Expect.isFalse(p.isCancelled());

  // cancel()
  p = new Promise();
  p.cancel();
  Expect.isTrue(p.isCancelled());

  // fail() after cancel()
  p.fail(-2);
  Expect.isTrue(p.isCancelled());
  
  // complete() after cancel()
  p = new Promise();
  p.cancel();
  p.complete(2);
  Expect.isTrue(p.isCancelled());

  // construction from value
  p = new Promise.fromValue(11);
  Expect.isFalse(p.isCancelled());
}