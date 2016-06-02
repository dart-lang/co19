/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap<K, V> class
 * Implements Map<K, V>
 * @description Checks that all members of [Map] are implemented.
 * @author kaigorodov
 */
import "dart:collection";
import "../../core/Map/compKeysTests.lib.dart" as compKeysTests;
import "nonCompKeysTests.lib.dart" as nonCompKeysTests;
import "../../core/Map/compKeysWarnTests.lib.dart" as compKeysWarnTests;

Map create([Map content]) {
  if (content == null) {
    return new SplayTreeMap();
  } else {
    return new SplayTreeMap.from(content);
  }
}  

main() {
  compKeysTests.test(create);
  nonCompKeysTests.test(create);
  compKeysWarnTests.test(create);
}
