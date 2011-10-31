/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isDone()
 * Whether the asynchronous work is done (normally or with errors).
 * @description Checks [: isDone() :] value of a promise in different states.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  // construction
  Promise p = new Promise();
  Expect.isFalse(p.isDone());

  // complete()
  p.complete(24);
  Expect.isTrue(p.isDone());

  // construction from value
  p = new Promise.fromValue(33);
  Expect.isTrue(p.isDone());

  // fail()
  p = new Promise();
  p.fail(-7);
  Expect.isTrue(p.isDone());

  // cancel()
  p = new Promise();
  p.cancel();
  Expect.isTrue(p.isDone());
}
