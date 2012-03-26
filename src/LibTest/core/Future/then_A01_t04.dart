/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void then(void onComplete(value))
 * When this future is complete and has a value,
 * then call the onComplete callback function with the value.
 * @description Checks that different onComplete functions don't
 * conflict with each other.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  var firstThen;
  var secondThen;
  var thirdThen;

  f.then((fValue) {
    firstThen = 1;
  });

  f.then((fValue) {
    secondThen = 2;
  });

  f.then((fValue) {
    thirdThen = 3;
  });

  completer.complete(0);
  Expect.equals(1, firstThen);
  Expect.equals(2, secondThen);
  Expect.equals(3, thirdThen);
}