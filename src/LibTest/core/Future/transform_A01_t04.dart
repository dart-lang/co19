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
 * @description Checks that [transformation] is called if
 * a future had a value before calling [transform].
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  completer.complete(0);
  bool visited = false;

  f.transform((value) {
    visited = true;
  });

  Expect.isTrue(visited);

  f = new Future.immediate(0);
  visited = false;
  f.transform((value) {
    visited = true;
  });

  Expect.isTrue(visited);
}
