/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class RangeError
 * @description Checks all methods of RangeError
 * @author sgrekhov@unipro.ru
 */
library allTests_A01_t01;

import "start_A01_t01.test.dart" as start_A01_t01;
import "end_A01_t01.test.dart" as end_A01_t01;

test(RangeError create(num invalidValue, int minValue, int maxValue)) {
  start_A01_t01.test(create);
  end_A01_t01.test(create);
}
