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
 * @description Checks that [transformation] is called with
 * the correct argument.
 * @author msyabro
 * @reviewer kaigorodov
 */

check(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  bool failed=false;
  
  f.transform((fValue) => failed=(value!=fValue));

  completer.complete(value);
  Expect.isFalse(failed);
}

main() {
  check(1);
  check('a');
  check(null);
  check(const [1, 2]);
}
