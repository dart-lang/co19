/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void forEach(void f(K key, V value))
 * Applies f to each {key, value} pair of the map.
 * @description Checks that an exception thrown by the argument
 * function breaks iteration and is passed through to the caller.
 * @author varlax
 */
library forEach_A01_t04;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  
  map["1"] = 3;
  map["2"] = 5;
  map["3"] = 8;
  
  int count = 0;
  try {
    map.forEach((var key, var value) {
      if (count++ > 0) throw "stop";
    });
    Expect.fail("Exception expected");
  } on String {}

  Expect.isTrue(count == 2);
}
