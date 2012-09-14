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
 * @description Checks that [transformation] is not called if
 * a future is not completed.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  bool visited = false;

  Future t = f.transform((value) {
    visited=true;
  });

  Expect.isFalse(visited);

}
