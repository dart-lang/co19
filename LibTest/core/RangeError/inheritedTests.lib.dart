/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class RangeError
 * @description Checks all methods inherited from ArgumentError
 * @author sgrekhov@unipro.ru
 */
library inheritedTests_A01_t01;

import "../ArgumentError/allTests.lib.dart" as argumentError;

test(ArgumentError create([value, String name, message])) {
  argumentError.test(create);
}
