/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion get error()
 * Error that occurred while computing the value, if any; null otherwise.
 * @description Checks that [: error :] value of a promise with provided value returns null.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  Promise p = new Promise();
  p.complete(23);
  Expect.equals(p.error, null);

  p = new Promise.fromValue(21);
  Expect.equals(p.error, null);
}
