/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion get error()
 * Error that occurred while computing the value, if any; null otherwise.
 * @description Calls exceptions on freshly constructed promises.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  Promise p = new Promise();
  Expect.isNull(p.error);
}
