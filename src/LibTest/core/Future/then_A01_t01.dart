/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void then(void onComplete(value))
 * When this future is complete and has a value,
 * then call the onComplete callback function with the value.
 * @description Checks that [onComplete] is called when a future is complete.
 * @author msyabro
 * @reviewer kaigorodov
 */

check(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  bool visited = false;
  f.then((fValue) {
    visited = true;
  });

  completer.complete(value);
  Expect.isTrue(visited);
}

main() {
  check(0);
  check('');
  check(false);
  check([]);
  check(new Object());
  check(new NullPointerException());
}