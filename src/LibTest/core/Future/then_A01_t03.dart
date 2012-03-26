/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void then(void onComplete(value))
 * When this future is complete and has a value,
 * then call the onComplete callback function with the value.
 * @description Checks that [onComplete] is called if a future is
 * already complete before setting a callback.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  completer.complete(1);

  bool visited = false;
  f.then((fValue) {
    visited = true;
  });
  Expect.isTrue(visited);

  visited = false;
  f = new Future.immediate(1);
  f.then((fValue) {
    visited = true;
    Expect.equals(1, fValue);
  });
  Expect.isTrue(visited);
}