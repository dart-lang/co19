/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fail(var error)
 * Indicate that an error was found while computing this value.
 * @description Checks that [:fail():] indicates an error with value [error].
 * @author msyabro
 * @reviewer kaigorodov
 */

check(var error) {
  Promise p = new Promise();
  p.fail(error);

  Expect.isTrue(p.isDone());
  Expect.isTrue(p.hasError());
  Expect.equals(error, p.error);
}

main() {
  check(-1);
  check(null);
  check(new Object());
  check((int x) => x + 1);
  check("error");
}

