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
import "dart:collection";
import "inherited_tests.lib.dart";

Map create([Map content]) {
  if (content == null) {
    return new HashMap();
  } else {
    return new HashMap.from(content);
  }
}  

main() {
  test(create);  
}
