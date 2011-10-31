/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by
 * [ifAbsent]. Returns the value in the map.
 * @description Checks that an exception thrown by the argument function
 * breaks operation and is passed through to the caller.
 * @author varlax
 * @reviewer msyabro
 */



main() {
  Object f() {
    throw new NullPointerException();
  }
  
  Map<String, Object> map = new Map<String, Object>();
  try {
    map.putIfAbsent("1", f);
    Expect.fail("NullPointerException should be thrown");
  } catch(NullPointerException e) {}
  Expect.isTrue(map.isEmpty());
}
