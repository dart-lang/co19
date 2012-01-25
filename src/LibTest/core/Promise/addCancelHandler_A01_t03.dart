/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addCancelHandler(void cancelHandler())
 * Register a handler to execute when [cancel] is called.
 * @description Checks that all  callbacks are invoked.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */

var arr;

createCallback(idx) {
  return foo() {
    arr[idx]=true;
  };
}

main() {
  var p = new Promise();
  var cnt = 43;
  arr = new List<bool>(cnt);

  for(var i = 0; i < cnt; i++) {
    p.addCancelHandler(createCallback(i));
  }

  p.cancel();

  Expect.equals(arr.length, cnt);

  for (var i = 0; i < cnt; i++) {
    Expect.isTrue(arr[i]);
  }
}
