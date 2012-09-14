/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws exception if any of the arguments is null.
 * @description Checks that exception is thrown.
 * @author iefremov
 * @needsreview not documented
 */

main() {
  Expect.throws(() => new Date.fromMillisecondsSinceEpoch(null, true));
  Expect.throws(() => new Date.fromMillisecondsSinceEpoch(1, null));
}
