/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addCompleteHandler(void completeHandler(T result))
 * Register a normal continuation to execute when the value is available.
 * @description Checks that [:complete():] will not call handler if promise is cancelled.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  var p = new Promise();

  foo(val) {
    Expect.fail("foo is called");
  }

  p.addCompleteHandler(foo);

  p.cancel();
  p.complete(5);

  
  p = new Promise();
  p.cancel();
  p.addCompleteHandler(foo);
  p.complete(3);
}
