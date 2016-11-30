/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator <(num other)
 * @description Checks .0 and -.0.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


main() {
  Expect.isFalse(-.0 < .0);
  Expect.isFalse(.0 < -.0);
}
