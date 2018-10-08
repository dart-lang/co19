/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class ArgumentError
 * @description Checks all methods of ArgumentError
 * @author sgrekhov@unipro.ru
 */
library allTests_A01_t01;

import "invalidValue_A01_t01.test.dart" as invalidValue_A01_t01;
import "message_A01_t01.test.dart" as message_A01_t01;
import "name_A01_t01.test.dart" as name_A01_t01;

test(ArgumentError create([value, String name, message])) {
  invalidValue_A01_t01.test(create);
  message_A01_t01.test(create);
  name_A01_t01.test(create);
}
