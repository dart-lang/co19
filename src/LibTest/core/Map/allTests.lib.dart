/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<K, V> abstract class 
 * @description Checks that all members of [Map] are implemented.
 * @author kaigorodov
 */
library allTests;

import "clear_A01_t01.test.dart" as clear_A01_t01;
import "containsKey_A01_t01.test.dart" as containsKey_A01_t01;
import "containsKey_A01_t02.test.dart" as containsKey_A01_t02;

test(Map create([Map content])) {
  clear_A01_t01.test(create);
  containsKey_A01_t01.test(create);
  containsKey_A01_t02.test(create);
}