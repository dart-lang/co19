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
 * @description Checks that the returned future has the correct value.
 * @author msyabro
 * @reviewer kaigorodov
 */


main() {
  transformFunction(value) {
    return value * 2;
  };

  Completer completer = new Completer();
  Future f = completer.future;
  Future t = f.transform(transformFunction);

  completer.complete(2);
  Expect.isTrue(f.isComplete);
  Expect.isTrue(t.isComplete);
  Expect.equals(transformFunction(f.value), t.value);
}