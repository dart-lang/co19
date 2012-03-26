/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future transform(Function transformation)
 * A future representing [transformation] applied to this future's value.
 * When this future gets a value, [transformation] will be called on the
 * value, and the returned future will receive the result.
 * @description Checks that different transformation functions
 * don't conflict with each other.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Future t1 = f.transform((value) {
    return value * 2;
  });

  Future t2 = f.transform((value) {
    return 0;
  });

  Future t3 = f.transform((value) {
    throw 0;
  });

  f.then((fValue) {
    Expect.isTrue(t1.hasValue);
    Expect.equals(fValue * 2, t1.value);

    Expect.isTrue(t2.hasValue);
    Expect.equals(0, t2.value);

    Expect.isFalse(t3.hasValue);
    Expect.equals(0, t3.exception);
  });

  completer.complete(1);
}