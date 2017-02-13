/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<K, V> abstract class 
 * @description Checks that non-comparable keys are rejected.
 * @author kaigorodov
 */
library nonCompKeysTests;

import "addAll_A01_t02.test.dart" as addAll_A01_t02;
import "clear_A01_t01.test.dart" as clear_A01_t01;
import "containsKey_A01_t02.test.dart" as containsKey_A01_t02;
import "forEach_A01_t02.test.dart" as forEach_A01_t02;
import "operator_subscript_A01_t02.test.dart" as operator_subscript_A01_t02;
import "operator_subscripted_assignment_A01_t02.test.dart" as
    operator_subscripted_assignment_A01_t02;

test(Map create([Map content])) {
  addAll_A01_t02.test(create);
  clear_A01_t01.test(create);
  containsKey_A01_t02.test(create);
  forEach_A01_t02.test(create);
  operator_subscript_A01_t02.test(create);
  operator_subscripted_assignment_A01_t02.test(create);
}
