/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap<K, V> abstract class 
 * Implements Map<K, V>
 * @description Checks that all members of [Map] are implemented.
 * @author kaigorodov
 */
library inherited_tests_hashmap;

import "../../core/Map/compKeysTests.lib.dart" as compKeysTests;
import "../../core/Map/nonCompKeysTests.lib.dart" as nonCompKeysTests;
import "../../core/Map/compKeysWarnTests.lib.dart" as compKeysWarnTests;

test(Map create([Map content])) {
  compKeysTests.test(create);  
  nonCompKeysTests.test(create);
  compKeysWarnTests.test(create);
}
