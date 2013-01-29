/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Fails gracefully if supplied with an argument of invalid type.
 * @description Checks that the constructor doesn't crash.
 * @static-warning
 * @author iefremov
 */

import "../../../Utils/dynamic_check.dart";

main() {
  Expect.throws(() => new List.from(1)); /// static type warning
  Expect.throws(() => new List.from("")); /// static type warning
  Expect.throws(() => new List.from(3.14)); /// static type warning
}
