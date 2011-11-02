/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasValue()
 * Whether the work represented by this promise has computed a value.
 * @description Checks [: hasValue() :] value of a promise in different states.
 * @author pagolubev
 * @reviewer msyabro
 */


check(val) {
  Promise p = new Promise();
  Expect.isFalse(p.hasValue());

  p.complete(val);
  Expect.isTrue(p.hasValue());

  p = new Promise.fromValue(val);
  Expect.isTrue(p.hasValue());
  
  p = new Promise();
  p.cancel();
  Expect.isTrue(p.hasValue());
  
  p = new Promise();
  p.fail("error");
  Expect.isTrue(p.hasValue());
}

main() {
  check(35);
  check(null);
}
