/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion undocumented
 * @description Checks that method throws an exception when given an URI that points
 * to a script that declares a top-level function but it's not named 'main'.
 * @author rodionov
 * @needsreview documentation looks incomplete
 */

import "dart:isolate";


main() {
  Expect.throws(() => spawnUri("spawnUri_A02_t03_bad_isolate.dart"));
}
