/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addErrorHandler(void errorHandler(var error))
 * Register an error continuation to execute if an error is found.
 * @description Checks that [:fail():] will not call handler if promise is cancelled.
 * @author pagolubev
 * @reviewer kaigorodov
 */


main() {
  var p = new Promise();

  foo(val) {
    Expect.fail("foo is called");
  }

  p.addErrorHandler(foo);
  p.cancel();
  p.fail(-1);

  
  p = new Promise();
  p.cancel();
  p.addErrorHandler(foo);
  p.fail(-1);
}
