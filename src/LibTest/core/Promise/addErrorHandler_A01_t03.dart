/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addErrorHandler(void errorHandler(var error))
 * Register an error continuation to execute if an error is found.
 * @description Checks that callbacks are invoked in the order they were added.
 * @author pagolubev
 * @reviewer kaigorodov
 */


var error;
var arr;

createCallback(idx) {
  return foo(err) {
    Expect.equals(err, error);
    arr[idx]=true;
  };
}

main() {
  var p = new Promise();
  var cnt = 43;
  error = -1;
  arr = new List(cnt);

  for(var i = 0; i < cnt; i++) {
    p.addErrorHandler(createCallback(i));
  }

  p.fail(error);

  Expect.equals(arr.length, cnt);

  for (var i = 0; i < cnt; i++) {
    Expect.isTrue(arr[i]);
  }
}
