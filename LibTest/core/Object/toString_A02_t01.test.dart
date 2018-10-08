/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * @description Checks that toString() returns non null result
 *
 * @author a.semenov@unipro.ru
 */
library toString_A02_t01;
import "../../../Utils/expect.dart";

test(Object create()) {
  Expect.isNotNull(create().toString());
}
