/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void addAll(Map<K, V> other)
 * Adds all key-value pairs of other to this map.
 * @description Checks that an exception is thrown if keys in different pairs
 * are not mutually comparable.
 * @author kaigorodov
 */
library addAll_A01_t01;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  Map other = {1 : 0, "2" : 2, 3.0 : null};
  
  Expect.throws(() { map.addAll(other); });
}
