/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies [f] to each {key, value} pair of the map.
 * @description Tries to pass function with wrong signature as [f]
 * @dynamic-type-error
 * @author msyabro
 * @needsreview undocumented
 */

check(var func) {
  Map m = {"1": 3, "2": 5};
  try {
    m.forEach(func);
    Expect.fail("ClosureArgumentMismatchException is expected");
  } catch(ClosureArgumentMismatchException e) {}
}

main() {
  check(void f() {});
  check(void f(var a){});
  check(void f(var a, var b, var c){});
}
