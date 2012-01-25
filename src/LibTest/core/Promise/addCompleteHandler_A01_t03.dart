/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addCompleteHandler(void completeHandler(T result))
 * Register a normal continuation to execute when the value is available.
 * @description Checks that all registared callbacks are invoked.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


var result;
var arr;

createCallback(idx) {
  return foo(val) {
    Expect.equals(val, result);
    arr[idx]=result;
  };
}

main() {
  var p = new Promise();
  var cnt = 43;
  result = 1;
  arr = new List<int>(cnt);

  for(var i = 0; i < cnt; i++) {
    p.addCompleteHandler(createCallback(i));
  }

  p.complete(result);

  Expect.equals(arr.length, cnt);

  for (var i = 0; i < cnt; i++) {
    Expect.equals(arr[i], result);
  }
}
