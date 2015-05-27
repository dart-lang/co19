/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double exp(num x)
 * Throws an error if [x] is a null.
 * @description Checks that Error is thrown when passed argument is a null.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.throws( () {
    Math.exp(null);
  });
}
