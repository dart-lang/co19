/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Fails gracefully if the argument is not a collection.
 * @description Checks that nothing crashes when the argument is an integer, a string or a double.
 * @static-warning
 * @author iefremov
 */
import "../../../Utils/expect.dart";

import "../../../Utils/dynamic_check.dart";

main() {
  Expect.throws(() => new List().addAll(1)); /// static type warning
  Expect.throws(() => new List().addAll("")); /// static type warning
  Expect.throws(() => new List().addAll(3.14)); /// static type warning
}
