/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<K, V> abstract class 
 * @description Checks that all members of [Map] are implemented, using
 * comparable keys.
 * @author kaigorodov
 */
library compKeysWarnTests;

import "forEach_A01_t02.test.dart" as forEach_A01_t02;
import "putIfAbsent_A01_t07.test.dart" as putIfAbsent_A01_t07;
import "putIfAbsent_A01_t08.test.dart" as putIfAbsent_A01_t08;

test(Map create([Map content])) {
  forEach_A01_t02.test(create);
  putIfAbsent_A01_t07.test(create);
  putIfAbsent_A01_t08.test(create);
}
