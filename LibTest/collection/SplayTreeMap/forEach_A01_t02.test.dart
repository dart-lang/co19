/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void forEach(void f(K key, V value))
 * Applies [f] to each {key, value} pair of the map.
 * @description Checks that something is thrown when the argument is [null] or
 * has a type that is incompatible with the required function type.
 */
library forEach_A01_t02;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  dynamic map = create();
  dynamic x = 1;
  
  map["1"] = 3;
  map["2"] = 5;
  
  Expect.throws(() => map.forEach(null));
  Expect.throws(() => map.forEach(x));
}
