/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion undocumented
 * @description Checks that method throws an exception when given null, an integer or a List.
 * @static-warning
 * @author iefremov
 * @needsreview documentation looks incomplete
 */

import "dart:isolate";


main() {
  Expect.throws(() => spawnUri(null));
  Expect.throws(() => spawnUri(1)); /// static type warning
  Expect.throws(() => spawnUri([])); /// static type warning
}
