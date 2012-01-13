/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion get error()
 * Error that occurred while computing the value, if any; null otherwise.
 * @description Checks that [: error :] returns value specified by [: fail() :].
 * @author pagolubev
 * @reviewer msyabro
 */


check(err) {
  Promise p = new Promise();

  p.fail(err);
  Expect.equals(p.error, err);
}

main() {
  check(-8);
  check(null);
}
