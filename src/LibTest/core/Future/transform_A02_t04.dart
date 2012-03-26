/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future transform(Function transformation)
 * If an exception occurs (received by this future, or thrown by
 * [transformation]) then the returned future will receive the exception.
 * @description  Checks that if an exception is thrown at invocation of [transformation]
 * the returned future receives an exception.
 * @author msyabro
 * @reviewer kaigorodov
 */

#import('../../../Utils/dynamic_check.dart');

check(notClosure) {
  Completer completer = new Completer();
  Future f = completer.future;

  Future t = f.transform(notClosure);

  completer.complete(0);

  Expect.isTrue(t.isComplete);
  Expect.isTrue(t.exception !== null);
}

main() {
  if(isCheckedMode()) {
    return;
  }
  check(0);
  check('');
  check([[]]);
  check({});
  check(new Object());
  check(true);
}