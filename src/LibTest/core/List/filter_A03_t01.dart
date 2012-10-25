/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Passing a null (if the list is not empty) or incompatible argument
 * results in an exception or error.
 * @description Checks that something is thrown if the list is not empty and the
 * argument is null, or if the argument's type is incompatible with the required
 * function type.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */

class A {
  A() {}
}

check(var arg) {
    Expect.throws(() => ["1","2","3"].filter(arg));
    Expect.throws(() => const ["1","2","3"].filter(arg));
    Expect.throws(() => new List.from(["1","2","3"]).filter(arg));
}
 
main() {
  check(false);
  check(1);
  check("every");
  check([1, 2, 3]);
  check(new A());
  check(null);
}
