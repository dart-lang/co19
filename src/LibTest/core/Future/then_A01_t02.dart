/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void then(void onComplete(value))
 * When this future is complete and has a value,
 * then call the onComplete callback function with the value.
 * @description Checks that the correct value is passes to [onComplete].
 * @author msyabro
 * @reviewer kaigorodov
 */

class C {
  const C();
}

check(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  f.then((fValue) {
    Expect.equals(value, fValue);
  });

  completer.complete(value);
}

main() {
  check(1e98);
  check('value');
  check(true);
  check(const {});
  check(const  C());
}