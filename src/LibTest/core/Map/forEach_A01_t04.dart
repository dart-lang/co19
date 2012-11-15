/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies [f] to each {key, value} pair of the map.
 * @description Checks that an exception thrown by the argument
 * function breaks iteration and is passed through to the caller.
 * @author varlax
 * @reviewer msyabro
 */


main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map["1"] = 3;
  map["2"] = 5;
  map["3"] = 8;
  
  int count = 0;
  try {
    map.forEach((String key, Object value) {
      if (count++ > 0) throw new NullPointerException();
    });
    Expect.fail("NullPointerException should be thrown");
  } on NullPointerException catch(e) {}
  Expect.isTrue(count == 2);
}
